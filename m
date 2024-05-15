Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F394E8C6845
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 16:07:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722408.1126321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7FHw-0005Dn-OZ; Wed, 15 May 2024 14:07:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722408.1126321; Wed, 15 May 2024 14:07:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7FHw-0005BH-Lv; Wed, 15 May 2024 14:07:24 +0000
Received: by outflank-mailman (input) for mailman id 722408;
 Wed, 15 May 2024 14:07:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EWeN=MS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7FHu-0005B6-Vf
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 14:07:22 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7284826c-12c4-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 16:07:21 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-56e1baf0380so2051158a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 07:07:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733bed0035sm9051531a12.50.2024.05.15.07.07.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 07:07:20 -0700 (PDT)
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
X-Inumbo-ID: 7284826c-12c4-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715782041; x=1716386841; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k0PfqxX7BVmMsAZzKFvyNkhPpeR8HETprZKZjx0qju0=;
        b=bILRp+3GTIFNODGJBNIcgQ+8zKoJIDNICSAQU9J5ZAU1uM6CWUKsuvkyX23zNtadm1
         eKHxO7PD1ZgSZCo4hyMR0OLDUNdKY/kaYk2N+9tYZbR7gVjvDuMtlbF0YIAhSsFSHUPA
         uGPE32a8sPwnjsbefM/oqsnO2a+OuFbAVaGx27ae+vkpNomKDt0HvHZCP+wX9PjIMR4q
         oc2dFzx79f74WgoGKraABuzxVcyo4WKEf0dUV7iTrk7k45iReYKwMjyztjes00gIYsjY
         8TWyYoJu0UwG1nS1jfDBrgBVJIVTbB/wK5aM0wfwTOdIQTdOfPf9q2716GRJ7fr/zcnd
         TTMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715782041; x=1716386841;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k0PfqxX7BVmMsAZzKFvyNkhPpeR8HETprZKZjx0qju0=;
        b=ALRj8R3snc8/y5UY9qFQYpUeUHrsFHQrBmO7qrX5E++b/OI2kFYuwiB3JJJ1AleDa2
         crc/aGT6+q17TXY189R37TKmDxD8T68fi1FSNAURNqGYI4a9vbXIAoc2JPBkmPYIuPxh
         RnIMrTGO3Wn++KfXjA4Kc4+5RME8UYmmPJAIOW9g4jw5w7bhcRfDRzBgcQZbFZFiJ3CL
         Ppao6pVsWHoHogwLexddORCQ8vBxjVU3iZMGzQ/oZt3Cua5CXkRCyapOEZfoCIFPrUCt
         d7jUL+T0t4xVw5JnZZJGrN3KBbjhh/vwXENqg5spmY4M0s6ScJWqf/7r788By4ppPb5L
         IQfA==
X-Forwarded-Encrypted: i=1; AJvYcCUg7Es2P8PPXbw9+o1zbYFsOd8r0l214Jc12/O0UU/Cy/G/Jh8No/dI2zMxaegck6apexcOJFyy2dumdZRbL3T4uptZNW2BBa0pYGOv6nQ=
X-Gm-Message-State: AOJu0Ywv2aJCb0zXNjABKviOGftXOFaEyefWfYbv1Y9Z7ocynF2K90yQ
	9wR3uul1R2Kb4j120kUhBeiBEZdRR3ODVbJfIDV6wJnhxzmkiDi/Dl5Z+p26OA==
X-Google-Smtp-Source: AGHT+IGnMvc9sGONal+ESoQrP2J9BZXybaiKAnruUK+Z1n4UzwMOo+1hI8fMLgmDmd/Due0jcqJAeQ==
X-Received: by 2002:a50:d59d:0:b0:56d:c91c:dfc2 with SMTP id 4fb4d7f45d1cf-5734d67eca7mr11808269a12.31.1715782041212;
        Wed, 15 May 2024 07:07:21 -0700 (PDT)
Message-ID: <ea90fd21-1ec4-46b5-b157-810466b3f0ab@suse.com>
Date: Wed, 15 May 2024 16:07:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 03/15] xen/bitops: implement fls{l}() in common logic
Content-Language: en-US
To: "Oleksii K." <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1714988096.git.oleksii.kurochko@gmail.com>
 <fe183f7e8ada7c3fb00ebf9b38f1fffffcc9c2d7.1714988096.git.oleksii.kurochko@gmail.com>
 <c16c0554-c376-41f4-bfe8-04c977702a04@suse.com>
 <46fd5c698fc13ffa3e8e82ed507bcfa67a9ef819.camel@gmail.com>
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
In-Reply-To: <46fd5c698fc13ffa3e8e82ed507bcfa67a9ef819.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.05.2024 15:55, Oleksii K. wrote:
> On Wed, 2024-05-15 at 11:09 +0200, Jan Beulich wrote:
>> On 06.05.2024 12:15, Oleksii Kurochko wrote:
>>> Changes in V9:
>>>  - update return type of fls and flsl() to unsigned int to be
>>> aligned with other
>>>    bit ops.
>>
>> But this then needs carrying through to ...
>>
>>> --- a/xen/arch/arm/include/asm/arm64/bitops.h
>>> +++ b/xen/arch/arm/include/asm/arm64/bitops.h
>>> @@ -22,17 +22,15 @@ static /*__*/always_inline unsigned long
>>> __ffs(unsigned long word)
>>>   */
>>>  #define ffz(x)  __ffs(~(x))
>>>  
>>> -static inline int flsl(unsigned long x)
>>> +static inline int arch_flsl(unsigned long x)
>>
>> ... e.g. here. You don't want to introduce signed/unsigned
>> mismatches.
> Do you mean that generic flsl() uses 'unsigned int' as a return type,
> but arch_flsl continue to use 'int'?

Yes.

>> Also why do you keep "inline" here, while ...
>>
>>> --- a/xen/arch/x86/include/asm/bitops.h
>>> +++ b/xen/arch/x86/include/asm/bitops.h
>>> @@ -425,7 +425,7 @@ static always_inline unsigned int
>>> arch_ffsl(unsigned long x)
>>>   *
>>>   * This is defined the same way as ffs.
>>>   */
>>> -static inline int flsl(unsigned long x)
>>> +static always_inline int arch_flsl(unsigned long x)
>>
>> ... you switch to always_inline here?
> Because Adnrew's patch with bitops.h for x86 changes to always_inline,
> so to be consistent, at least, for architecture.

And why not extend this to Arm?

Jan

