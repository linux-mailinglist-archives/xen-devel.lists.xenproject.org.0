Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1205AA71460
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 11:04:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927475.1330218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txNcY-0007fG-OI; Wed, 26 Mar 2025 10:04:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927475.1330218; Wed, 26 Mar 2025 10:04:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txNcY-0007d9-LA; Wed, 26 Mar 2025 10:04:26 +0000
Received: by outflank-mailman (input) for mailman id 927475;
 Wed, 26 Mar 2025 10:04:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SgUP=WN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txNcW-0007d3-Tg
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 10:04:24 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa7bea7f-0a29-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 11:04:12 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-399744f74e9so4190198f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 03:04:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9e65besm16538712f8f.65.2025.03.26.03.04.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 03:04:10 -0700 (PDT)
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
X-Inumbo-ID: aa7bea7f-0a29-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742983451; x=1743588251; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tzOL1w/MdP5+VKo/vU/f5HHLIXXry4EJRGo9or/8T5o=;
        b=NqrPg0jQ1q1RzkowHy98G4kynggyBUyTy+OH95KJuZ3Sm8UWdBME5xoUU76beodnss
         0un3xXe71GycQIk1fPzFBBQ4DIv3zZP3vLqATUi4wv+zMxAQKfD0sNDpWhXnWW/UKv/f
         4KJLAW6eOgkpEGwZEtS80jxGnySgX881hq0iwcLmIEMfOcCWVqQUKdBEqTVZEJkbR0E0
         iDeC+yCPlhkdDmbmw6MxRz/vdB5U2rvlaC39KA488wpVCtENd452zzX8OeLqduGAqI6S
         YzHWdLjRX5ivwt7dQJuf1WDshkialJFNNwTidjPPuqXJ5Pnrm/odqiZCQ3jZOLDjzZlS
         r2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742983451; x=1743588251;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tzOL1w/MdP5+VKo/vU/f5HHLIXXry4EJRGo9or/8T5o=;
        b=roNaNialOe7+aOsp5AnxX4fzvSGXeHeEj/9nVRnQ9gePGkb7/gcU5uWPAENB9DgIca
         /3nCQugxrEwD+O0phdma8TzWIWH3jl2iJIGKXO9hqZWwa/KSFpod7ESy9hUcXhzEf8tq
         Tej/Jeo5yrz6vDKNngQVdjAeHZ0Zcy1sfmZKk95go+uGO2tLq8GDZxVwAEsaBoqrLpgO
         NwpBu3pOczo5uqqQgOmFypfaEWMEPYBHFRMCPL7UWZf2STga1jTn73YiBgt88DwkDAl/
         0sX2dGR8hKliv6TJCjbE1hv9lAGHZvlAvJOjcs1c50Id4OR+e9qSElU1QKBMHVpJZu+3
         1Eag==
X-Forwarded-Encrypted: i=1; AJvYcCUknHrJ4EjmRLNO/VzV/LpRKSCLh4W3YRpSdzQlmVuEBrFkkKjg/J5Nyv1tEXZCY6yvAKK6MqKh23c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzyKQIXvFGJc/OuM4OS3wKoT3i1ItOo6uIqSfgUmpBbi2zzPjtN
	nUMXSMEz+feFFCHXzsa21DB5euL4xEjO9/FKLwLV8R3sCW89QHSrC0FF4cQtJg==
X-Gm-Gg: ASbGnctChwBT6mc5Hvd8sf1jvSraKZxQg2tvgCvwdOGJ6pWdj4ye36H6T/sh2YwWkjy
	1x8yi5Lmf6zNxgYjsaSl/P0hZ7q8OyIJavEuGqoRYSCWZcQ/B3L0KErmghihqv39WCteaYq4ip+
	Fe5+Ar1QWHTad+NLwTlkf0eMNBwYWWm9iDU0z6/tix705/REh2lNN5K4t0nqRjptTGHNoYqcFaA
	2vbo0x1ogCYNjfe/LbQNsGKoCbcnfa0+Ke68X2xEUtRq121qsVVKopsFXd/++mBZ4TFgfDmpjNv
	RWBGZ7W9c3z0LIhAaLRB8+2ZPm2fqR5xczewUL67wDmiYyI0MteZipCRZ1uS05/X7xvXbLZEKMs
	lrvZxjP+vjHFE0tJfl2Qv+fBEH0vKuQ==
X-Google-Smtp-Source: AGHT+IGpy/ym73Q5qjeP+eOLuVpz4ypqKUT/gAxDimYOtOCfBPxvfkoUECguVzs6nwJJ6O4AgUMY+g==
X-Received: by 2002:a05:6000:418a:b0:391:49f6:dad4 with SMTP id ffacd0b85a97d-3997f94de0dmr14020291f8f.41.1742983451276;
        Wed, 26 Mar 2025 03:04:11 -0700 (PDT)
Message-ID: <2e6598ae-dcc6-4905-b282-662ba7349ce4@suse.com>
Date: Wed, 26 Mar 2025 11:04:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] xen: introduce Kconfig ARCH_PAGING_MEMPOOL
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Wei Chen <wei.chen@arm.com>,
 xen-devel@lists.xenproject.org, Oleksii Kurochko
 <oleksii.kurochko@gmail.com>, Luca Fancellu <luca.fancellu@arm.com>
References: <20250317200727.798696-1-luca.fancellu@arm.com>
 <20250317200727.798696-7-luca.fancellu@arm.com>
 <85ba02a9-f9f9-4141-85be-a9a2d431e450@gmail.com>
 <26583ecf-4057-46b1-8f87-f4589d7bec17@suse.com>
 <136cf1c5-d1e5-471d-b560-51632b444e41@gmail.com>
 <94865aea-043b-4f52-adb8-d2d78dba293b@suse.com>
 <0957c74f-a53d-4107-bc8d-e13d7c308d39@amd.com>
 <8c160573-ca40-4bf0-bf67-ee905fe9fb12@suse.com>
 <e44de603-c2f7-47cf-8c7c-0f63227b723d@amd.com>
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
In-Reply-To: <e44de603-c2f7-47cf-8c7c-0f63227b723d@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.03.2025 10:59, Orzel, Michal wrote:
> On 26/03/2025 10:54, Jan Beulich wrote:
>> On 26.03.2025 10:39, Orzel, Michal wrote:
>>> On 20/03/2025 08:32, Jan Beulich wrote:
>>>> On 19.03.2025 17:31, Oleksii Kurochko wrote:
>>>>> On 3/19/25 12:35 PM, Jan Beulich wrote:
>>>>>> On 18.03.2025 14:05, Oleksii Kurochko wrote:
>>>>>>> On 3/17/25 9:07 PM, Luca Fancellu wrote:
>>>>>>>> From: Penny Zheng<Penny.Zheng@arm.com>
>>>>>>>>
>>>>>>>> ARM MPU system doesn't need to use paging memory pool, as MPU memory
>>>>>>>> mapping table at most takes only one 4KB page, which is enough to
>>>>>>>> manage the maximum 255 MPU memory regions, for all EL2 stage 1
>>>>>>>> translation and EL1 stage 2 translation.
>>>>>>>>
>>>>>>>> Introduce ARCH_PAGING_MEMPOOL Kconfig common symbol, selected for Arm
>>>>>>>> MMU systems, x86 and RISC-V.
>>>>>>>>
>>>>>>>> Wrap the code inside 'construct_domU' that deal with p2m paging
>>>>>>>> allocation in a new function 'domain_p2m_set_allocation', protected
>>>>>>>> by ARCH_PAGING_MEMPOOL, this is done in this way to prevent polluting
>>>>>>>> the former function with #ifdefs and improve readability
>>>>>>>>
>>>>>>>> Introduce arch_{get,set}_paging_mempool_size stubs for architecture
>>>>>>>> with !ARCH_PAGING_MEMPOOL.
>>>>>>>>
>>>>>>>> Remove 'struct paging_domain' from Arm 'struct arch_domain' when the
>>>>>>>> field is not required.
>>>>>>>>
>>>>>>>> Signed-off-by: Penny Zheng<penny.zheng@arm.com>
>>>>>>>> Signed-off-by: Wei Chen<wei.chen@arm.com>
>>>>>>>> Signed-off-by: Luca Fancellu<luca.fancellu@arm.com>
>>>>>>>> ---
>>>>>>>> v3 changes:
>>>>>>>>    - Introduced ARCH_PAGING_MEMPOOL instead of HAS_PAGING_MEMPOOL
>>>>>>>> v2 changes:
>>>>>>>>    - make Kconfig HAS_PAGING_MEMPOOL common
>>>>>>>>    - protect also "xen,domain-p2m-mem-mb" reading with HAS_PAGING_MEMPOOL
>>>>>>>>    - do not define p2m_teardown{_allocation} in this patch
>>>>>>>>    - change commit message
>>>>>>>> ---
>>>>>>>>    xen/arch/arm/Kconfig              |  1 +
>>>>>>>>    xen/arch/arm/dom0less-build.c     | 74 ++++++++++++++++++++-----------
>>>>>>>>    xen/arch/arm/include/asm/domain.h |  2 +
>>>>>>>>    xen/arch/riscv/Kconfig            |  1 +
>>>>>>>>    xen/arch/x86/Kconfig              |  1 +
>>>>>>>>    xen/common/Kconfig                |  3 ++
>>>>>>>>    xen/include/xen/domain.h          | 17 +++++++
>>>>>>>>    7 files changed, 73 insertions(+), 26 deletions(-)
>>>>>>> For RISC-V:
>>>>>>>    Reviewed-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>>>>>> Mind me asking then why RISC-V needs this at this point? The stubs surely
>>>>>> were added to address some build issue, not because they are actively
>>>>>> meaningful?
>>>>>
>>>>> Only because we have stubs and not to have redefinition compilation
>>>>> error. And, yes, they are not actively meaningful now, at least. I am
>>>>> okay with not enabling of this config for RISC-V but then seems to me we
>>>>> have to drop stubs in riscv/stubs.c. ~ Oleksii
>>>>
>>>> Well, I don't think it's "have to", but I agree that dropping them would
>>>> make sense then (and be desirable).
>>> @Jan, @Oleksii, is there anything blocking this patch to be committed (Luca
>>> question does not seem to be answered)? Other patches in the series are ready to
>>> be merged.
>>
>> While I think Oleksii's reply has sufficiently clarified things, I still wonder:
>> What question of Luca are you referring to? There's none visible in context here
>> afaics. The two questions that are visible were raised by me, and answered by
>> Oleksii (also visible in context above). There was an implication to draw from
>> that, yes, which Oleksii has now made explicit in his reply to your mail.
> Sure thing. I'll clarify. Here Luca asks question to you if it is possible for
> RISCV guys to handle it afterwards:
> https://lore.kernel.org/xen-devel/D86D58F5-1EDD-4362-B163-5AD25C5DCC51@arm.com/
> https://lore.kernel.org/xen-devel/F827A271-0E9B-4240-BB1E-C039E9EE5656@arm.com/
> and you did not answer to these e-mails.

I simply saw no need after Oleksii had replied.

Jan

