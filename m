Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 272F087C157
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 17:35:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693383.1081387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rko2t-00037y-3j; Thu, 14 Mar 2024 16:35:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693383.1081387; Thu, 14 Mar 2024 16:35:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rko2t-00034u-0r; Thu, 14 Mar 2024 16:35:07 +0000
Received: by outflank-mailman (input) for mailman id 693383;
 Thu, 14 Mar 2024 16:35:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n3nm=KU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rko2r-00034o-Ni
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 16:35:05 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfa83ca7-e220-11ee-afdd-a90da7624cb6;
 Thu, 14 Mar 2024 17:35:04 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a468004667aso5208466b.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 09:35:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 i12-20020a1709064fcc00b00a4671721babsm775175ejw.208.2024.03.14.09.35.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 09:35:04 -0700 (PDT)
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
X-Inumbo-ID: cfa83ca7-e220-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710434104; x=1711038904; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VyO1w9mGTBI1hva3ZwaMWtjIpqiAoenVVUo8FHOBu6E=;
        b=CIolnPI9ZrWJy4NXFmarjI5FkCWCygxwsFAXW5no2qYM8nKHGmFpAOSG+YoY90MtPG
         t3mx0LwysPs5EHqyOJulIj+rp95aAuDqmPTv6rUmGthYESeBunUQq8EBFq4qRHu66pCi
         SQD1UsBD3x26HCKIpuWmRnZDT3Mo5DAHRAUK9FTJ1DWe5I7Pvei1Kl/Wq6551rgcH251
         lol3HI6sRicD1cgg/q7rIA5sQF7FYzSc1VntuBxEXzxuDKRptwqebjMmpzDCUmPzmxGm
         7CiyNubBCB6ilsgnOxizMIGK1khNWaneOFpy6FhycxL+7nccBhnuPYFaDdGlIo3NJxsf
         OCMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710434104; x=1711038904;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VyO1w9mGTBI1hva3ZwaMWtjIpqiAoenVVUo8FHOBu6E=;
        b=aQ3UTLP3Yhvpihg2eAcLt7zfFYNQ93z8OGA14I4IPtoh3vGWxpvgPOMbc0uZUHV8dn
         GAE4aOYKhMFPyI2fh/XW980tsFRVxup+pQh8Z9xqJHJlbJVtwrI9XTDkNDV42HL/BS//
         L1c/ggDPMM7NXVGj0aBEAHpZ1ZFthZbylSZcuUMP0whR8cXeiGj6tJ6o2k/lQg/k6AyT
         yFMuFla2yXDNVZh/LKSNuQq8PmzoiBW6shGH+B+KeEUDKZAE3UXQakkjLMdb5mkbmy5v
         lHYn9jp5V1meHKD5hrJoLsbX6hvQZK6WJ50GwWefI83sBJFK3pWeTgZ3SlJ7xZJUW1UK
         sXqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGo4BGJxJePxji1Fsk50vI15d+jjn8vu4kF33dgs16DisRiNbKYLO28wUrZ8N9ziaDNlMncrJ+E+Su0oEKwbG2LR9p2rwH8j4lByPG/5g=
X-Gm-Message-State: AOJu0YweRQtWZYKDkPs9V7BqQDKgk9HWPRCye+QkVGTMbRw0WXVPY8oN
	WZHKHLYUtx9JdIFp0TBuE9EEFiZtJ9hifE/w54EDMwDjV0Yv5HHt+1rEg/KRDg==
X-Google-Smtp-Source: AGHT+IEOxPg04E7dOA8H2rbdnSzTk+WscLVX9lTCXX6ojmK3ZrLEFB+5uim0VIUZ7aaa0IjieIYHpA==
X-Received: by 2002:a17:907:8b9b:b0:a46:74d2:a0e7 with SMTP id tb27-20020a1709078b9b00b00a4674d2a0e7mr1485517ejc.11.1710434104230;
        Thu, 14 Mar 2024 09:35:04 -0700 (PDT)
Message-ID: <06cedbcc-fee9-4a58-a0bb-42f6b594ccf8@suse.com>
Date: Thu, 14 Mar 2024 17:35:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] xen/bitops: Implement ffs() in common logic
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240313172716.2325427-1-andrew.cooper3@citrix.com>
 <20240313172716.2325427-3-andrew.cooper3@citrix.com>
 <76a1e81d-86d1-438c-975e-c4db46af93ee@suse.com>
 <6a3c09a1-f35f-4d1e-bbba-342388da71ef@citrix.com>
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
In-Reply-To: <6a3c09a1-f35f-4d1e-bbba-342388da71ef@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.03.2024 17:23, Andrew Cooper wrote:
> On 14/03/2024 2:16 pm, Jan Beulich wrote:
>> On 13.03.2024 18:27, Andrew Cooper wrote:
>>> --- a/xen/arch/arm/include/asm/bitops.h
>>> +++ b/xen/arch/arm/include/asm/bitops.h
>>> @@ -157,7 +157,7 @@ static inline int fls(unsigned int x)
>>>  }
>>>  
>>>  
>>> -#define ffs(x) ({ unsigned int __t = (x); fls(ISOLATE_LSB(__t)); })
>>> +#define arch_ffs(x) ({ unsigned int __t = (x); fls(ISOLATE_LSB(__t)); })
>> The way the macro is invoked, I don't think the helper local variable
>> is then needed anymore?
> 
> I strongly suspect It is still needed.  ISOLATE_LSB() double-expands its
> parameter.

Even that double evaluation doesn't matter when the invoking entity is an
inline function, and it doesn't use any non-trivial expression as argument.

>>> --- a/xen/include/xen/bitops.h
>>> +++ b/xen/include/xen/bitops.h
>>> @@ -110,6 +110,21 @@ static inline int generic_flsl(unsigned long x)
>>>  
>>>  #include <asm/bitops.h>
>>>  
>>> +/*
>>> + * Find First Set bit.  Bits are labelled from 1.
>>> + */
>>> +static always_inline __pure unsigned int ffs(unsigned int x)
>> Why always_inline?
> 
> For all the normal reasons to counter Clang and GCC doing stupid things
> with inlines that contain assembly.

Hmm, there are issues when the asm() would look "complex" to the compiler,
but that's not the case here. I was asking because, as you imply by how
you responded, we may need to gain many more always_inline when at some
time even you were arguing against overriding compiler decisions like this
(unless I'm mis-remembering).

Jan

