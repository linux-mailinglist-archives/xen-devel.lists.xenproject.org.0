Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6770CAE367F
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 09:11:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022032.1397734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTbKz-0005gh-Gp; Mon, 23 Jun 2025 07:11:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022032.1397734; Mon, 23 Jun 2025 07:11:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTbKz-0005dd-De; Mon, 23 Jun 2025 07:11:29 +0000
Received: by outflank-mailman (input) for mailman id 1022032;
 Mon, 23 Jun 2025 07:11:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H8L6=ZG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uTbKy-0005dX-B3
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 07:11:28 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46ca174e-5001-11f0-a30f-13f23c93f187;
 Mon, 23 Jun 2025 09:11:26 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a57ae5cb17so2080608f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jun 2025 00:11:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7490a2f467esm7428530b3a.0.2025.06.23.00.11.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 00:11:25 -0700 (PDT)
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
X-Inumbo-ID: 46ca174e-5001-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750662686; x=1751267486; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Zol6nRtAy4BAAD2ESaZwpEMoPdOolbgmSqeZRix3N60=;
        b=Qz7kTRofgmzP6DjmpmXMlPtJLWnCR7oRACMG5c1qMGaEwSKusDN3u9U+4D4CGOkNqf
         6ktJKczVBmHiPS7gtKO7Eta16tcwgH+Xa/WmE9LZio8N1vyI8z3kj5mFIwUHyvx0ZS54
         O614SAL18uq04GKGu4hdV4nStSQvBB0jiu4bbYwE1ejiKYRSRfcFK3po2zg4jQ7G8Py5
         5CivXs/QR8OHofrSnC8yP6sDGgpd9Jy8ffblXJQevVFYvnF4c4gKvw0cHB+INlNHBJ/c
         lzvodu28U+feaJx44PYp1sCWlbgjNG1u5DFZ8Z3/OLgGuDs9gojwEC38+eaxx/Z0oSzT
         /xAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750662686; x=1751267486;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zol6nRtAy4BAAD2ESaZwpEMoPdOolbgmSqeZRix3N60=;
        b=b6shsqXjysKuidQRGs4+EMF20aYnYdAX3qf3FEFq7fiXkpRZJ8BB16vCwlpsBG9EiS
         3v+9FcPrHrqiijF53R1WIxVc+pG6mCm0m2nlnQcSH1SX/GoAcKpoT0wr1mmqbOuz+em0
         yd9xg6exlwI4q/t8n6bmD/Kgcc+Egcayi9xNN5dci1UxqJu0qwAkas2pfMFYSCZavoVp
         6bHzGhYbafAqpF8tWc1P8RNUZ87YqEacz6MfTfIhB+crLVbAgLuHMhqHsktGiQWQH5HJ
         C5T9+qxJMBlvHILtNbrBmlCyoajNjsuTniat50cSSDlYxiCVVDmk24dDj+fhwN6vz4N+
         u9IA==
X-Forwarded-Encrypted: i=1; AJvYcCWO9I1dnvWeCjuWkOyOcTm8kKjMB4fYJjroOsKayLiODTQIli/lY9H6LFI1MPMY00V/yCTssIow7CQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyclX//8gz+k6HSia4Hi/wEcQ/X/jaH1FQHrEEy2BxHwUwgKxTw
	nXfd33rg5gWX84BPQx2sqVjLjulx3giYcv2QvricPlCLd92ec9m7DmZtUWLrS6evZ6mXqzqZMzZ
	HuIo=
X-Gm-Gg: ASbGncsqcLiXNqHKypweZjMQ/7+zie/iJbPGeGkhsJbhv7QqjuwWriGv0zz7ypfjk+F
	16EVnaKh9EJjKSkAe7hxE0b3QvLtRntywLN6sRsBDUIN1GXahb/qBkxtTfuqyTjko7z8CHydKzJ
	EmhWTg6tIEsLHwCNs1MnD1ImBVjtNyk47Z21LoHSUDR7+0rCxrROYxg/zT5zfMJMFWqsO/ye1gT
	3qbfRObThpud+ePKERt2f7gS+PVO670+FZuVVQV8jXkQnQDJmJc+SbaGBjg4VN1tJit/9rRMkq6
	EyOWGkVPt25MyHvXkATjEEW4tdi3dOsBKZ+6xrjdDQTE4dhES40knKYmF/aNBPiYTphrRFhz09B
	l9SJFSuV6/RrcRnI2ymDKkK2cJN/ieo4f/jRnA+d1UnHdseI=
X-Google-Smtp-Source: AGHT+IGvmoBtxC48yYndYKupMReu3K/DEErbg1TXNxQVtFfTxCf7vmv+PtWzT/7a+XGyF+fLago8/Q==
X-Received: by 2002:a05:6000:471e:b0:3a4:dfc2:bb60 with SMTP id ffacd0b85a97d-3a6d12a9a5amr6825098f8f.26.1750662685638;
        Mon, 23 Jun 2025 00:11:25 -0700 (PDT)
Message-ID: <818cd2f3-705f-4190-85c4-d9df26edc95b@suse.com>
Date: Mon, 23 Jun 2025 09:11:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: remove memcmp calls non-compliant with Rule 21.16.
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
 xen-devel@lists.xenproject.org, federico.serafini@bugseng.com
References: <20250604233537.2892206-1-stefano.stabellini@amd.com>
 <c252a43a-4e00-4584-bbb1-05347aa9b49f@suse.com>
 <alpine.DEB.2.22.394.2506051624050.2495561@ubuntu-linux-20-04-desktop>
 <13ad335c1868bcc02e2dc0a8da521f6d@bugseng.com>
 <alpine.DEB.2.22.394.2506061347230.2495561@ubuntu-linux-20-04-desktop>
 <315e605d-2da6-4df5-b791-b3f59e0ff6d4@suse.com>
 <alpine.DEB.2.22.394.2506201921290.2978375@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2506201921290.2978375@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.06.2025 04:25, Stefano Stabellini wrote:
> On Tue, 10 Jun 2025, Jan Beulich wrote:
>> On 06.06.2025 22:49, Stefano Stabellini wrote:
>>> On Fri, 6 Jun 2025, Nicola Vetrini wrote:
>>>>>>> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
>>>>>>
>>>>>> Missing your own S-o-b.
>>>>>>
>>>>>> Also (nit) may I ask that you drop the full stop from the patch subject?
>>>>>
>>>>> I'll add the S-o-B and fix the subject
>>>>>
>>>>>
>>>>>>> --- a/xen/arch/x86/dmi_scan.c
>>>>>>> +++ b/xen/arch/x86/dmi_scan.c
>>>>>>> @@ -233,7 +233,7 @@ void __init dmi_efi_get_table(const void *smbios,
>>>>>> const void *smbios3)
>>>>>>>  	const struct smbios_eps *eps = smbios;
>>>>>>>  	const struct smbios3_eps *eps3 = smbios3;
>>>>>>>
>>>>>>> -	if (eps3 && memcmp(eps3->anchor, "_SM3_", 5) == 0 &&
>>>>>>> +	if (eps3 && strncmp(eps3->anchor, "_SM3_", 5) == 0 &&
>>>>>>
>>>>>> Unlike the last example given in the doc, this does not pose the risk of
>>>>>> false "not equal" returns. Considering there's no example there exactly
>>>>>> matching this situation, I'm not convinced a change is actually needed.
>>>>>> (Applies to all other changes here, too.)
>>>>>
>>>>> If we consider string literals "pointer types", then I think you are
>>>>> right that this would fall under what is permitted by 21.16. Nicola,
>>>>> what do you think?
>>>>>
>>>>
>>>> While I agree that the result of the comparison is correct either way in these
>>>> cases, the rule is written to be simple to apply (i.e., not limited only to
>>>> those cases that may differ), and in particular in the rationale it is
>>>> indicated that using memcmp to compare string *may* indicate a mistake. As
>>>> written above, deviating the string literal comparisons is an option, which
>>>> can be justified with efficiency concerns, but it goes a bit against the
>>>> rationale of the rule itself.
>>>
>>> Also looking at Andrew's reply, it seems that the preference is to
>>> deviate string literals. The change to docs/misra/rules.rst is easy
>>> enough, but I am not sure how to make the corresponding change to
>>> analysis.ecl.
>>>
>>> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
>>> index e1c26030e8..56b6e351df 100644
>>> --- a/docs/misra/rules.rst
>>> +++ b/docs/misra/rules.rst
>>> @@ -813,7 +813,7 @@ maintainers if you want to suggest a change.
>>>         shall point to either a pointer type, an essentially signed type,
>>>         an essentially unsigned type, an essentially Boolean type or an
>>>         essentially enum type
>>> -     - void* arguments are allowed
>>> +     - void* and string literals arguments are allowed
>>
>> Yet as per my earlier reply: This would go too far, wouldn't it?
> 
> You are suggesting:
> 
> "void* arguments are allowed. string literals arguments are allowed when
> the last argument passed for the comparison is equal to the size of the
> string."
> 
> Please suggest another wording if you prefer.

Just some marginal change:

"void* arguments are allowed. string literal arguments are allowed when
 the last argument passed for the comparison is less or equal to the size
 of the string."

Without the "less than" part I expect we'd run into issues when certain
signatures are checked. The size of the string literal includes the nul
terminator, whereas signatures typically don't.

Jan

