Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0201A72AA5
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 08:39:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928532.1331223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txhpX-00020F-W8; Thu, 27 Mar 2025 07:39:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928532.1331223; Thu, 27 Mar 2025 07:39:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txhpX-0001yq-SN; Thu, 27 Mar 2025 07:39:11 +0000
Received: by outflank-mailman (input) for mailman id 928532;
 Thu, 27 Mar 2025 07:39:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txhpW-0001yk-DF
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 07:39:10 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91a10ffb-0ade-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 08:39:09 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-39ac8e7688aso423442f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 00:39:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d830f5f22sm28124385e9.30.2025.03.27.00.39.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 00:39:08 -0700 (PDT)
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
X-Inumbo-ID: 91a10ffb-0ade-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743061149; x=1743665949; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f/e5WuW0HVCiCOzbWvayFEgAyTWKwiuX91S8IXidC3Y=;
        b=QoymylEx8ZuAqw/q6Yfx1QAjaZfSheb9sxroMbdVOLWvlmfbq1PFn12PKkv/TloX/N
         Oi+2/PEqzkxtZpPB3BBPoI0D/hkAQUC05DFFEyT6PWXfxuUomediYtD49b0O9WPaYBMx
         DYEr9i62kqJV1/ealhOhVNbFD6mbJsgvS6Vzfzw1xkBPU0s76EYgjh9lGPKpn1dXZsR3
         tQZjandtRZ1456SCuytd2j9m9EoyT+dU1PvOQFv2IlMVuz+UeQisUbIGlT1Mtwh8cceo
         qbfsFkOpOi39XP+H0DvCeu1qIwNj1ehxQODOZqgfqYLRgIjt7mElq0Ou9csHuAQXapft
         8Ozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743061149; x=1743665949;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/e5WuW0HVCiCOzbWvayFEgAyTWKwiuX91S8IXidC3Y=;
        b=F0UH5CUCysQ9BtnRHdpdWSFsOZZdcmUFqkL+tZLBiliLU2lzIQnsNLMT4EEfSGmbg2
         n2zADZKM0kE19m9ZxNj7oOgM09TW9B3cfJ9F1X2uhEuCBHUfqzcL7rzDkoLgsRzBQyQn
         Snh+QcT615JZ7J88vS5j6hPewsEN9wjqPhf5sfq9c/iluV234wX5oW6cAEAIioClhh17
         1DxN6Xkxlt4YRsxbWyqRTGkdkcTyuqyZ7xA8v6Ty6kFAPZw/pb/uP/sGGBDrmCt74ckz
         T64S/MJQDzHci/xbLz/fdNY7mCIAi8mdZb6aWiLuzod15jsRxHMv9CoFmuHNCPbk+6tu
         B6qA==
X-Forwarded-Encrypted: i=1; AJvYcCUf96OgdTWB83aNpN55Ub/6TSIyw+vlDKbk7N6KuO0qqeqOYnbYuEL3G9+048O6Jyg/vyTffOg71ig=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxezJ97o33kItgZeO4jU3BH2LGQSvYx9kwpCjELegiSZubwHH3X
	0KwdbTJHBZWWq76UPmr5vR6AlHdGG38ObHFwiOgVCG1jB6SqAKyiiqsGuq92Bg==
X-Gm-Gg: ASbGncsSiUPeu3LqkLRj9LhMiPiz0Kxp+IEv/yKlHdhK30Nj5CFrtMWmtg5r1G/tFAB
	OKgUrCAyBtrtPBdtOxYZJ/1/I49+4oztMq82GivEZvoNkrB9g79fGTdGm1Oqf/p0INTU6JhAYn6
	LTy9PWnMClcvv6Yp7iZNSoN97sd1YVZWidqsqEHHiSADGjAgRj0TLddYF5mmo9nMgqYRZOCVnza
	vu9PHil4IjtVVJhz392uIo63xQd2cW4UURVKoXSQzIXBS9mSra+JaR15HoaXf/cwILAMat5W79X
	Eypaby2xOVXtPvEclvArsdTVBGRh1b6STXggvz1p8oQ6DNTMFgJ7jXKK6XYIm323GHHHlPV2xx2
	nfBwVU0N3pyVx0RPbWm0hnyjUo8b9ww==
X-Google-Smtp-Source: AGHT+IHzGYrBTXHrg5rZ9y05RkVdfrERoRX7P4zCHJoRSgrsorJSzHUazxwgQpt7j3CEss9dJn7AjA==
X-Received: by 2002:a5d:47c5:0:b0:391:412b:e23f with SMTP id ffacd0b85a97d-39ad1746282mr2052145f8f.15.1743061148536;
        Thu, 27 Mar 2025 00:39:08 -0700 (PDT)
Message-ID: <b0af1e38-9c27-469e-8bc9-321d3c49dd2c@suse.com>
Date: Thu, 27 Mar 2025 08:39:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] xen/riscv: implement basic aplic_preinit()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <1a04711f46a1c0a7cdf709abc37f143747215495.1742918184.git.oleksii.kurochko@gmail.com>
 <f0945e3a41e911b5dfd005a8d15aa0d668d8e3cf.1742918184.git.oleksii.kurochko@gmail.com>
 <e9fddc7d-feb3-4fd0-830f-de4b7ef17bba@suse.com>
 <242f04d2-50b6-4ce1-8710-6dae2f940b9e@gmail.com>
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
In-Reply-To: <242f04d2-50b6-4ce1-8710-6dae2f940b9e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.03.2025 17:49, Oleksii Kurochko wrote:
> On 3/26/25 4:19 PM, Jan Beulich wrote:
>> On 25.03.2025 18:36, Oleksii Kurochko wrote:
>>> Introduce preinitialization stuff for the RISC-V Advanced Platform-Level
>>> Interrupt Controller (APLIC) in Xen:
>>>   - Implementing the APLIC pre-initialization function (`aplic_preinit()`),
>>>     ensuring that only one APLIC instance is supported in S mode.
>>>   - Initialize APLIC's correspoinding DT node.
>>>   - Declaring the DT device match table for APLIC.
>>>   - Setting `aplic_info.hw_version` during its declaration.
>>>   - Declaring an APLIC device.
>>>
>>> Since Microchip originally developed aplic.c [1], an internal discussion
>>> with them led to the decision to use the MIT license instead of the default
>>> GPL-2.0-only.
>>>
>>> [1]https://gitlab.com/xen-project/people/olkur/xen/-/commit/7cfb4bd4748ca268142497ac5c327d2766fb342d
>>>
>>> Signed-off-by: Romain Caritey<Romain.Caritey@microchip.com>
>>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>> You recall that From: != 1st S-o-b is unusual, and wants some explanation.
>> IOW it's unclear who the original author of this patch is.
> 
> I'm not 100% sure who should be the author. Such patch doesn't exist before but I took the changes
> based on the changes mentioned in commit message as [1].
> 
> If you think that the author should be Romain, I am okay with that.

I can't sensibly form an opinion here. This needs settling between him and you.
From your reply I'm not even convinced his S-o-b is legitimately there then.
You may want to use another, less standard tag in such a case (like the
Co-developed-by: that I've seen in use here and there) to still give credit to
him.

>>> --- /dev/null
>>> +++ b/xen/arch/riscv/aplic.c
>>> @@ -0,0 +1,49 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +
>>> +/*
>>> + * xen/arch/riscv/aplic.c
>>> + *
>>> + * RISC-V Advanced Platform-Level Interrupt Controller support
>>> + *
>>> + * Copyright (c) 2023-2024 Microchip.
>>> + * Copyright (c) 2024-2025 Vates
>>> + */
>>> +
>>> +#include <xen/errno.h>
>>> +#include <xen/init.h>
>>> +#include <xen/types.h>
>>> +
>>> +#include <asm/device.h>
>>> +#include <asm/intc.h>
>>> +
>>> +static struct intc_info aplic_info = {
>>> +    .hw_version = INTC_APLIC
>>> +};
>> Is this going to be written to (much) post-init? IOW - __read_mostly or
>> even __ro_after_init?
> 
> I think that __read_mostly would be better because intc_info structure in the future
> will contain member "void *private". And in `private` it can be a data which can
> be changed.

You mean the pointer can change? Or merely what it points to, i.e. ...

> For example, `private` can contain an aplic_priv structure:
> struct aplic_priv {
>      /* number of irqs */
>      uint32_t   nr_irqs;
> 
>      /* base physical address and size */
>      paddr_t    paddr_start;
>      paddr_t    paddr_end;
>      uint64_t   size;
> 
>      /* registers */
>      struct aplic_regs   *regs;
> 
>      /* imsic configuration */
>      const struct imsic_config *imsic_cfg;
> };
> 
> and regs from aplic_priv structure can be changed in runtime.

... the contents of such a struct? In this latter case the struct instance
here can still be __ro_after_init as long as the pointer is set from an
__init function.

Jan

