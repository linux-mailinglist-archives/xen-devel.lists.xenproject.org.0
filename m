Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 259EDA6DF1D
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 16:56:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925865.1328745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twk9v-0000Kj-8M; Mon, 24 Mar 2025 15:56:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925865.1328745; Mon, 24 Mar 2025 15:56:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twk9v-0000JD-5k; Mon, 24 Mar 2025 15:56:15 +0000
Received: by outflank-mailman (input) for mailman id 925865;
 Mon, 24 Mar 2025 15:56:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sMR0=WL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1twk9t-0000Ir-J7
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 15:56:13 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 826bedaa-08c8-11f0-9ea2-5ba50f476ded;
 Mon, 24 Mar 2025 16:56:12 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-39127512371so2992488f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Mar 2025 08:56:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9a3af8sm11470772f8f.31.2025.03.24.08.56.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 08:56:11 -0700 (PDT)
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
X-Inumbo-ID: 826bedaa-08c8-11f0-9ea2-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742831772; x=1743436572; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kvoZi78M+nHQVoz+f/cTGXabC+GTXglJDbvfQM9tS6s=;
        b=ItcVH3/e2Hs7PY9fA55SKhHDwtAXkKpL+ixdixcE5dwfzFEUrVwNSQ792C1FiVKPY5
         tWFRDvBPmqHUrurIIDlfakYya7Pc25fxc0KbCk/5BnvbKi9TzGK5F510SOxc1lVwPrDA
         AtQOj4ARqm81tD1A9Ech2P/AIlITrX7EBaiAQ8JrOQtSf9ZBaM4seETh82L7omZcBPTO
         EIY6h2wzltGfnnd9z1pMd8WGOrMw4ohtYPUgNCUJ59dfP0J3VK7wdh+0Q2TAohTBD7Jp
         c5a/DVUm0SeEzmp5fM/tAXSFTyWD95iPlPctbF+AxbzSGxnBjSBBGI05Wigr0vcQLDsX
         luSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742831772; x=1743436572;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kvoZi78M+nHQVoz+f/cTGXabC+GTXglJDbvfQM9tS6s=;
        b=sahPBEew4tlRKAHSBQ2gVlOZeRF5/f9PogjH3YexEKjwwIeAswPpFLKpRMNCgXhT4P
         /BRCqRDOKSPF2Re5YJqY9ljRCydfK5EAx0aLRUokyVW51OHkBsoVahSQeJK/B6nQzntv
         tR1Hk704JZQi8YoTPssXp7U1Ku+dlF+tbfc2uZSZCCkUm+K/SGdXQPizvJhvra72TQkT
         szCynGEtHRbgWDofFmJYUcqkem9zbH0jxvg3cDsD7/ZrthlRFPWlz+0T2gOxMPowfAxj
         VMr2VtmYFo3BAKTsJDbihqeL+QbN8FPSboEQ65gWa26MBDF5g+qOq+ygG9r5JIqjGokz
         Cwag==
X-Forwarded-Encrypted: i=1; AJvYcCXG/h038Vfp6TJI031kzd1cOTbDxrXjx1V1ARNGLDL1MZJx2ud+bmQ1A/kOxUncO+6DjntNnVI/7Lw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx7WwOxUxNqRyUTOQd8jwlNS1yFupYFbrsc0ur/DD6n7nrLnWru
	UjETde1r9e+U9ADNHi6yWG0MyA1f+AucVLvGGdne5iTXVACRad1BTJCgXIH1sg==
X-Gm-Gg: ASbGnctUZ3VihVX2Dw/vJ1QmjfUlIAEpHTnu+WnV/OFYjbC72qCkznl61BEZStH6hNE
	e/Yy1KdpdudcZ5uA4PWDbCrTiaSuFie7VnbvCglBxwJ76PEfxmT4V7OoEMVQlzJXMDnmWe4TjWa
	lq3J/HWQS4Cyupin3S/yB+9FeWfiZrjwVACg0+Phu1aIkDwoT6/LllJGWthl3WRyBJYDYktKv4J
	GoyAX81lXOXepkv4bBSZXpjPLkqSLKaz9at4MlpAnUSy48OoGC3NGhXMLNSzwo9EwgOTVdpE39C
	EOwxEj2F4ChXEuPL1YxIVpoetfexIWVS3U6+ORoaa1rL6ef3+Aov8e7xXNVwIR6NZz2KFCRJsDd
	Tydhy96Li48fh5fThJrNeM5ub5oVBIA==
X-Google-Smtp-Source: AGHT+IGTBB7qmuPf4J7QrHa4hlT+kRFjMEROt/gMWRsUEEIGB2ZRp+ENS6uELd/XTIFKEkeSBbF73A==
X-Received: by 2002:a05:6000:4009:b0:391:300f:749e with SMTP id ffacd0b85a97d-3997f8f5d96mr10404963f8f.11.1742831771690;
        Mon, 24 Mar 2025 08:56:11 -0700 (PDT)
Message-ID: <dca708a0-f3e4-4e8c-8131-3244b7612034@suse.com>
Date: Mon, 24 Mar 2025 16:56:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] xen/riscv: introduce preinit_xen_time()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <3152c755e31367370f3e1d955253a9d4fc095f68.1741709885.git.oleksii.kurochko@gmail.com>
 <f633e10b-2bde-4574-ab87-fec5a2a52b07@suse.com>
 <27dc3481-1f48-46c5-a827-e0a44c17686d@gmail.com>
 <630f216a-10fa-4828-a64e-651dd7f70242@suse.com>
 <abfbdc78-6620-483a-b9fe-4a100cab04e5@gmail.com>
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
In-Reply-To: <abfbdc78-6620-483a-b9fe-4a100cab04e5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.03.2025 16:29, Oleksii Kurochko wrote:
> 
> On 3/20/25 8:36 AM, Jan Beulich wrote:
>> On 19.03.2025 18:29, Oleksii Kurochko wrote:
>>> On 3/17/25 4:24 PM, Jan Beulich wrote:
>>>> On 11.03.2025 17:19, Oleksii Kurochko wrote:
>>>>> --- /dev/null
>>>>> +++ b/xen/arch/riscv/time.c
>>>>> @@ -0,0 +1,38 @@
>>>>> +#include <xen/device_tree.h>
>>>>> +#include <xen/init.h>
>>>>> +#include <xen/lib.h>
>>>>> +#include <xen/sections.h>
>>>>> +
>>>>> +unsigned long __ro_after_init cpu_khz; /* CPU clock frequency in kHz. */
>>>>> +unsigned long __read_mostly boot_count;
>>>> Why not also __ro_after_init? And what is this variable actually needed
>>>> for? Common code doesn't use it, so a better name (describing what it
>>>> really holds) might be desirable, even if this then means not being in
>>>> sync with Arm code.
>>> To calculate more accurate amount of time since boot.
>> Okay. But how does the name of the variable reflect that? I.e. what it
>> is that the count of is being stored? The only meaning I could associate
>> to a variable of this name is the number of boot cycles a system went
>> through. I.e. nothing that an OS (or hypervisor) would normally count.
> 
> But an OS (or hypervisor) doesn't count it, they initialize a variable
> once (in my case, it was named as boot_count) and then just subtract it from
> get_cycles() to get time relative to this variable (so since Xen boot) and not
> since power on as nothing guarantee (at least, I can't find that in the RISC-V spec)
> that after power on the value in CSR_TIME will start from 0 what could lead to
> some issues, if my understanding is correct, such as if on SoC A timer starts from
> let it be 1000 and on SoC B timer value starts from 5000 then all measurements will be
> incorrect as Xen will think that for SoC B it was spent more time then for SoC A.
> 
> What do you think if boot_count will be renamed to xen_start_time or {initial_}boot_time?

Something like that, yes. Whether "time" in there is unambiguous enough I'm not
sure. "cycles" or "clock_cycles" or some such may help. I don't really want to
restrict you in what name you choose, just so long as the name reflects the
purpose in good enough a way.

Jan

