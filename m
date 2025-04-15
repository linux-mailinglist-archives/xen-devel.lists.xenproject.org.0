Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C13B9A89C1B
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 13:23:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.953669.1348121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4eNl-0000L1-3Z; Tue, 15 Apr 2025 11:23:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 953669.1348121; Tue, 15 Apr 2025 11:23:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4eNl-0000IP-0l; Tue, 15 Apr 2025 11:23:13 +0000
Received: by outflank-mailman (input) for mailman id 953669;
 Tue, 15 Apr 2025 11:23:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ai1O=XB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4eNi-0000IE-Vu
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 11:23:10 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0224577a-19ec-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 13:23:09 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso41879105e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 04:23:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f23572c38sm207139645e9.32.2025.04.15.04.23.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 04:23:07 -0700 (PDT)
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
X-Inumbo-ID: 0224577a-19ec-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744716188; x=1745320988; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/i5hE4OADgvjPStn1D42+mVG0FXCCZTURSG3ANRzQkE=;
        b=TIJNn+4PzWBFQPsoghhsO7roIa+jcebck1EKlW3x9PUVOmWQmn+BNbi5SdcA1jVbBR
         IGKZdB2hPLAMeD+2bcNTrnRL4mjDEwbtPyquNN8Wr7RMq72IgqHHsmmX79mE/qXs1VQd
         jLVWg9YzvEz29mzcoZWVBYCBxetdo3OMTQ48rVcKmd3mLrpbo5gtX21bRzTD5q4DrmQ4
         zgn84wu8/vdGY58nF6ypMTNjao6621plivHKWuQbEgiiOQGm1vvKaMF37dk6On8bIuWd
         tppNicHJTMdPqMGmI53gzRZjZk71sFkamTd2iH0y5H7wpjTlZaE8pyyQFQ0L4BO1X8qT
         tBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744716188; x=1745320988;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/i5hE4OADgvjPStn1D42+mVG0FXCCZTURSG3ANRzQkE=;
        b=VBoKpF2idIkNq89YC2RlkDFIJyHnS01O5HuzdfeXtF2nOPJefKtynFHGelObzSVCZ5
         0JumUIISKPl7oJQJz8bWc6BCxG2aTX8HZhAuEgrs/xkk8P8ISlhCqRetRSkQdoG9mqgi
         5GVSEAltzYKYPNx7se4qT9Q4W+MJlAS1JxhsgawKS4PE6dBEWQJeDrC/UIKgHlHeDk4N
         mzeYcDbju45dE5t1MAalQUD+kfGwR6kl/HByMLNPqSWGfogaP/3Bh0pJuBpY0J+GA1m/
         ox12+OmaAugrPvi5R1SIHfbr9tGaHlDPx1DUw99XMJCbpyMoHy3VKG4wpJawAQIzhz28
         DqpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGh0X3a/mdcdyT5iPqrCn3LCTqufMA7fQtg5DlUh0eMUWvmSK1J2cQMJkZfrKUDpoufvDE3FQmPpA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx/fmyipAt9M6zKXBoJdIRKZCI+bkhUkThVzHsYEMLE+2XMVio4
	jwfP1mtiM1jgfFQYC93SxoQE6/5QvDo4oJJUNnBi+KaTLOTb47yRoD7WZeGhpg==
X-Gm-Gg: ASbGncvbo0PPdu++wMBC0lMRQ+2doiw+0uzkPPsUihGA6UEeLwSWu/EcSgPN8ONir88
	Tm96VtYwu2wzZX5wBC+Djtfu98lk/SehpznQVDWuTUUMYkllZl3Xv50jft0qcbhTBOuX/qLvu1+
	RknjDTzrTR2jC57iJcSiMYfL0OkElhK8QOSAhCad6BznLMGKLepww0R36DYAXPMOMO6oE8KqvNZ
	9b04n5qRunvTBrayOlp0foc+jwmHYvO01nBbrwVp20iXpBWuYFv0B+63sFaC0SFuuDPboaZF2Mo
	QgCpRiV4BBKrWMmulMhcHgyuc6059yTmaAVQlSmcIWHkoN0nltsuU99ZI0LplIkxEjyG9M7hjHm
	E8GI5tvUVYvVlvGSyUh0vMjDTXrcgz4X8hzLv
X-Google-Smtp-Source: AGHT+IEOOg7sk9jlC8aYAivLEqasAEGiX7jCiLOTrNfm4KQfOcFwHbTBUm6Uc/LwJzjVs17KLwB8jw==
X-Received: by 2002:a05:600c:5494:b0:43d:10c:2f60 with SMTP id 5b1f17b1804b1-43f3a9ab0c2mr117201425e9.24.1744716188127;
        Tue, 15 Apr 2025 04:23:08 -0700 (PDT)
Message-ID: <664560b3-400d-485c-b50b-0614f0a3e49e@suse.com>
Date: Tue, 15 Apr 2025 13:23:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/14] xen/riscv: introduce platform_get_irq()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
 <6c6e7482cc3b0332f5724c80bf16931fe2d793ae.1744126720.git.oleksii.kurochko@gmail.com>
 <31de00cb-b3b4-4d15-a128-930dc1c7ccdf@suse.com>
 <16139d54-fc6f-4ecb-9b3e-ea1e110a1f0d@gmail.com>
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
In-Reply-To: <16139d54-fc6f-4ecb-9b3e-ea1e110a1f0d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.04.2025 13:11, Oleksii Kurochko wrote:
> On 4/10/25 5:35 PM, Jan Beulich wrote:
>> On 08.04.2025 17:57, Oleksii Kurochko wrote:
>>> @@ -21,6 +22,22 @@ static struct intc_info __ro_after_init aplic_info = {
>>>       .hw_version = INTC_APLIC,
>>>   };
>>>   
>>> +static int aplic_irq_xlate(const uint32_t *intspec, unsigned int intsize,
>> As you start adding functions calling indirectly, please consider adding cf_check
>> right away, even if right now this has no effect on RISC-V. That'll save you from
>> going through the entire RISC-V subtree later on to find them all.
> 
> Sure. I thought that it is a feature for x86 as I haven't seen such attribute for
> Arm and RISC-V in GCC manuals.

And that looks to be correct. I was under the (admittedly vague) impression
Arm64 had something equivalent in hardware, which then merely needs enabling
in the compiler. Not sure about RISC-V, but seeing the endless flow of
patches enabling new extensions in binutils, it would perhaps even be
surprising if nothing along these lines was already in the works somewhere.

Jan

