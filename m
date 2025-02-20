Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE1AA3D261
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 08:34:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893543.1302414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl157-000215-Sk; Thu, 20 Feb 2025 07:34:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893543.1302414; Thu, 20 Feb 2025 07:34:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl157-0001zW-PP; Thu, 20 Feb 2025 07:34:49 +0000
Received: by outflank-mailman (input) for mailman id 893543;
 Thu, 20 Feb 2025 07:34:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YfIj=VL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tl156-0001zO-Jr
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 07:34:48 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28b17dac-ef5d-11ef-9896-31a8f345e629;
 Thu, 20 Feb 2025 08:34:46 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5ded6c31344so916461a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 23:34:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbe1326bd1sm209547666b.172.2025.02.19.23.34.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 23:34:45 -0800 (PST)
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
X-Inumbo-ID: 28b17dac-ef5d-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740036886; x=1740641686; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TXlCZTREg30Phv/VcStZrdn5eMccFmVey7/j5JQkYLo=;
        b=HZk82w0kgiSZWlTFeQzSvan1Goevta0BPwCH+eWqz5MZbSZvFoCQArfBWdZbGk2JPW
         Vo5en4Xg4hrp+922L+qzi94Rxh5veHabeiFV+jq//c3pnNFIcMuTIsdqmMxgV1UrUyaL
         artDH17Y0Xpf++hbNHZ2Zg6bTECOdPFmoDq++o8KgPZVvKP+yQ5SYj3V7wRytE2DH2ud
         KBGp3gMTLQL9EI/YXYKQPC/oypTVqBVx9gYz4/Dql01xdTLECqtomIf3TT0HiTzidtm/
         wijv5F6pPf3k12vx21kWktxoYmd48PI/RKrfJBg3NB1HwXH0o0Y1FqVR7bVD0TJq3jNM
         GPNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740036886; x=1740641686;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TXlCZTREg30Phv/VcStZrdn5eMccFmVey7/j5JQkYLo=;
        b=qRlnRSndbjOLLKn/4OJQRTV8SrDkPF0GOUIlPEljagLf9IEUkBj/GYIqb4iJF3g7pk
         WQSURvby7jt+XDjTOLDJi02BKaKfva9Uyz3O5q6UIRu0E3/3Y9SSnqDrD4QAg/4MT+Q5
         v165vsRctVqyfIpOR5eyrwK/3SvsmNKrQo4u098IA5w5Ri6nSCfOyZQepsBvwL3Z9XTZ
         I3xyZwJRdx3YiSyiwNRi1g417VhcF7E1+ZmLtNvC/+jc1IQKOlNnxt8tJeJ7sMRBT5jR
         wAwtkXUq0nBtZauy/lgyGzK1iKOp3fb+rtB0XELLytLy5LPOcO7T29hTILpvf+EgbCtZ
         qPrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrbJnbM5k9OL7pVqKOzD35At7iMs/LVv67eWoa3MF+gNW5z67grl/XtuYnymkRxpvpKdl8zXqXlCk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyS5Afv5KHBfB1gMZd+fvYxSh0KtQUUAU6bxaFHFswr0isy9FR5
	50GdkYQpvtQWu9Z7k/WJOrkA3QlAO3vkSVgAt67gAdefZSaUi6OThSD+un0bkA==
X-Gm-Gg: ASbGncvyMreOVtJ6gjlnxzYT1L5wf1dgjqP2A4Wa7L7O8ukFgc0XyDti7V6n4MD64xk
	otYpIY1EnfvncbuDb/9rHP68f8rK1kpxDWBY/GplKrZ3mBfx30bHI3xy9kAAAYjTWFfe6CK0n+P
	thvHOWXmqtA3bcD4OfNLqTYcPa54pMNYy2ly0CP07/w7C6+yZHsM2/XaZOt0CO0OHaqCe1eOYrd
	7XAduMwioGA/7psN6sjjdhy5TqFPZH11+QvMhGnmBzUvtihG9ctsrA95zOn3hvnYltHP7vWpjz8
	d+rD355CMt5zLD3Ih74O1bxR+y6Nf7c1KerQmuG/SDVgMcYmMKM6qZjvSBnpYdJ5Io3WPpiKg76
	K
X-Google-Smtp-Source: AGHT+IEMuXMJGPPT2Ws4wg8HQb+QDkVYZPR6uezyXiyYJrxl+rZP2W8apIJFF3KDAGe7Ai0KwhFwKw==
X-Received: by 2002:a05:6402:2347:b0:5e0:8c55:50d with SMTP id 4fb4d7f45d1cf-5e08c5514bbmr13252311a12.14.1740036886140;
        Wed, 19 Feb 2025 23:34:46 -0800 (PST)
Message-ID: <792cb63d-35b3-4a8d-a1f2-25592e6c1bac@suse.com>
Date: Thu, 20 Feb 2025 08:34:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.21 v6 1/2] xen/riscv: drop CONFIG_RISCV_ISA_RV64G
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1739355004.git.oleksii.kurochko@gmail.com>
 <82c9611b923170b0525a7b76337ef067e359dc96.1739355004.git.oleksii.kurochko@gmail.com>
 <10155bb3-20c8-4d08-aafc-df41112c91c9@suse.com>
 <bc198221-7a98-4f61-af75-01decaebbdb7@gmail.com>
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
In-Reply-To: <bc198221-7a98-4f61-af75-01decaebbdb7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.02.2025 18:56, Oleksii Kurochko wrote:
> 
> On 2/18/25 6:03 PM, Jan Beulich wrote:
>>> --- a/xen/arch/riscv/arch.mk
>>> +++ b/xen/arch/riscv/arch.mk
>>> @@ -6,8 +6,13 @@ $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
>>>   riscv-abi-$(CONFIG_RISCV_32) := -mabi=ilp32
>>>   riscv-abi-$(CONFIG_RISCV_64) := -mabi=lp64
>>>   
>>> -riscv-march-$(CONFIG_RISCV_ISA_RV64G) := rv64g
>>> -riscv-march-$(CONFIG_RISCV_ISA_C)       := $(riscv-march-y)c
>>> +riscv-march-$(CONFIG_RISCV_64) := rv64
>>> +
>>> +riscv-march-y := $(riscv-march-y)ima
>>> +
>>> +riscv-march-$(CONFIG_RISCV_ISA_C) := $(riscv-march-y)c
>>> +
>>> +riscv-march-y := $(riscv-march-y)_zicsr_zifencei
>> The repeated use of := makes this longer than necessary, and hence harder to
>> read. I understand using += isn't exactly ideal either, because then on the rhs
>> no blanks may appear (aiui), being kind of against our style and potentially
>> hampering readability. Still maybe:
>>
>> riscv-march-$(CONFIG_RISCV_64) := rv64
>> riscv-march-y+=ima
>> riscv-march-$(CONFIG_RISCV_ISA_C)+=c
>> riscv-march-y+=_zicsr_zifencei
>>
>> ?
> 
> Btw, I think that we will still anyway strip spaces added by '+='. So it will also need to do something like:
>    [1] riscv-generic-flags := $(riscv-abi-y) -march=$(subst $(space),,$(riscv-march-y))
> 
> As without this I expect that -march will look like:
>    -march=rv64 ima c _zicsr_zifencei
> 
> With the change [1] we could have spaces around "+=":
>    riscv-march-y += ima
>    riscv-march-$(CONFIG_RISCV_ISA_C) += c
>    riscv-march-y += _zicsr_zifencei
> 
>    riscv-generic-flags := $(riscv-abi-y) -march=$(subst $(space),,$(riscv-march-y))

That would be fine with me of course, for being yet tidier (imo).

Jan

