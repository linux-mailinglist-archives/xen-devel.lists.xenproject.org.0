Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7929854A29
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 14:12:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680740.1058835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raF34-00086d-IG; Wed, 14 Feb 2024 13:11:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680740.1058835; Wed, 14 Feb 2024 13:11:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raF34-000854-Fc; Wed, 14 Feb 2024 13:11:38 +0000
Received: by outflank-mailman (input) for mailman id 680740;
 Wed, 14 Feb 2024 13:11:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l+oD=JX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raF32-00083h-EF
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 13:11:36 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93b38bfb-cb3a-11ee-98f5-efadbce2ee36;
 Wed, 14 Feb 2024 14:11:34 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-33ce2121d5dso671916f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 05:11:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bp9-20020a5d5a89000000b0033b4796641asm12593638wrb.22.2024.02.14.05.11.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 05:11:33 -0800 (PST)
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
X-Inumbo-ID: 93b38bfb-cb3a-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707916294; x=1708521094; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ukviu3LuM/V8muzTRtwHLcezGkJt0UeVaScTyjdwqDg=;
        b=B6gHuwa90bTm2Ed1vm4KRhAHfY9B7AYN+A100oITJ+OShAyFuyyh4VXpn4Y/Ckrwfm
         KgdDIPPpazk7uOHaA94yf74WOGJI3YAuhshdi5ptlrcN4kzW9vrLiqsW1lxoT088WKQ4
         GRCUKiTdzIh1n6J3DDD0S9d7UA98l/x2uYfCue21LVybROxZW4l9ZCaiC4YoHzXNCDEx
         6b1DnYNAolrQcIZ6VkWa8fhPnN541njeD3ySrTTKFWd/ByT9yqdekdTJFaSUcpKnmlaa
         yLRoxMF4QD9czR0KTEZK6LQMCiVmivPqDKabVQ7yVZ7najl73zlzUFkHrUwsMEgUgE5h
         mBDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707916294; x=1708521094;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ukviu3LuM/V8muzTRtwHLcezGkJt0UeVaScTyjdwqDg=;
        b=JY77KXte2YRTh+tOolSpU2CkvcQIbluylnkoxVrvthbsV/LchHW5ikBU/HPVLLxln3
         bRh/GBCy/lOLX9GlAp1hZD9hG0FXf0/aqfSlS/pbwZchzmf9j6JwRxsGt0e9XbSZkgwm
         8+iqJ8PxrgR4NEmsiq8qK8cYB2171bEOqSMt1gTL5kzSjYvAwj0lWCZedL3vrYnX6CrP
         6/wCfpXPIAzfIFtqDjEA7FYZHgSVffb+zgFUVqyXvGrsMJmbn6WUUmFmN/oh1U032gpA
         c1b0Hjb5/1hLu7ri0JojlrFTbo+ABlrjmzxT8umDVevJwcjoJuZrQj8h5zqIZiFZgwXn
         AtZA==
X-Forwarded-Encrypted: i=1; AJvYcCWZulEYhqy+Thk3fsBSZBomYEMwa8US78MA+frjnsbswh4rLy0B+/G/QwA+tklw36OqDpNgFexVXluFJ+O73dIJe0fG2DspyN+5vqGFUyg=
X-Gm-Message-State: AOJu0YzQS8V+U03I13b3HELgJ1mXwY9SYXkKKSp18v7BSv8R3T7OHL6o
	tJWAmd658aSe3zlj05PF2c1HuAm2MgN/pLtvsJMvKeD29raCc8Y1hVpKrVIJlg==
X-Google-Smtp-Source: AGHT+IF8GBh8485TPMDJWdvJhzAzeZzpHPe+Kh2EwqXpAcazV/83Xs+K1KUzJsDA03Av4OIuNS1WIA==
X-Received: by 2002:a5d:58eb:0:b0:33b:3a90:13ea with SMTP id f11-20020a5d58eb000000b0033b3a9013eamr1765462wrd.4.1707916293756;
        Wed, 14 Feb 2024 05:11:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXSmeageTS8VktOPPX3Uu18z0f9YjJFoRX+zVHgdsfL8KQDl9Jy4F0Bsh7bRdntwnMaW8pdG/VriPHgJZEXyDx3dkb1O8b8eETCGQMwco399XYKgko2o34Zf+Va1GuKGfJTaosLMEP3I3RdD/WFiCOmIEVATBJ0GOjOSuKb6sGj10SY9G/4CYPhUAInz3C5zocB5VoorcuUCTJj1p24XtDRy1ji+HcPjPcwgxAf7Oa8vT11TyKO40zWnYZ97SiTdQGEm5dPJCsNBNbrWRniu1HyYvMf5MBx+uvZ0gxXcsnX+RYYDjJaUeQ=
Message-ID: <be27de24-a6e8-4ea4-b835-9da365eac1b0@suse.com>
Date: Wed, 14 Feb 2024 14:11:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 19/30] xen/riscv: introduce event.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
 <a57aed8d2d8424c63b1f27d007b2d5cfe35460cc.1707146506.git.oleksii.kurochko@gmail.com>
 <36b25710-cf95-4250-bf4a-6ccf4f418909@suse.com>
 <39e07917c237a2d2e8879a66511edef4590d9fba.camel@gmail.com>
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
In-Reply-To: <39e07917c237a2d2e8879a66511edef4590d9fba.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.02.2024 13:16, Oleksii wrote:
> On Mon, 2024-02-12 at 16:20 +0100, Jan Beulich wrote:
>> On 05.02.2024 16:32, Oleksii Kurochko wrote:
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>> again with a nit, though:
>>
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/include/asm/event.h
>>> @@ -0,0 +1,40 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +#ifndef __ASM_RISCV_EVENT_H__
>>> +#define __ASM_RISCV_EVENT_H__
>>> +
>>> +#include <xen/lib.h>
>>> +
>>> +void vcpu_mark_events_pending(struct vcpu *v);
>>> +
>>> +static inline int vcpu_event_delivery_is_enabled(struct vcpu *v)
>>> +{
>>> +    BUG_ON("unimplemented");
>>> +    return 0;
>>> +}
>>> +
>>> +static inline int local_events_need_delivery(void)
>>> +{
>>> +    BUG_ON("unimplemented");
>>> +    return 0;
>>> +}
>>> +
>>> +static inline void local_event_delivery_enable(void)
>>> +{
>>> +    BUG_ON("unimplemented");
>>> +}
>>> +
>>> +/* No arch specific virq definition now. Default to global. */
>>> +static inline bool arch_virq_is_global(unsigned int virq)
>>> +{
>>> +    return true;
>>> +}
>>> +
>>> +#endif
>>
>> This want to gain the usual comment.
> Do you mean that commit messag should be updated?

No, I indeed mean "comment". Just go look what I committed yesterday.

Jan

