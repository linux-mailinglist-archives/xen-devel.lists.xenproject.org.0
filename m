Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2C88BAA82
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2024 12:11:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716338.1118458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2ps9-0006qq-7b; Fri, 03 May 2024 10:10:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716338.1118458; Fri, 03 May 2024 10:10:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2ps9-0006nw-4L; Fri, 03 May 2024 10:10:33 +0000
Received: by outflank-mailman (input) for mailman id 716338;
 Fri, 03 May 2024 10:10:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wM3W=MG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s2ps7-0006no-9q
 for xen-devel@lists.xenproject.org; Fri, 03 May 2024 10:10:31 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ea9c8da-0935-11ef-909c-e314d9c70b13;
 Fri, 03 May 2024 12:10:30 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-34b3374ae22so8257518f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2024 03:10:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 r8-20020a5d4988000000b0034cceee9051sm3367182wrq.105.2024.05.03.03.10.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 May 2024 03:10:29 -0700 (PDT)
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
X-Inumbo-ID: 5ea9c8da-0935-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714731029; x=1715335829; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6hTusBcHi9YxURLdUO/WLl8txt8QQtV1zWj91AU31ts=;
        b=RHGnZWjBpuYFCEUVAM5pNiumCNW1CKR/ZV2/J8a04uVEcaYY7kfdxRdUGTMTuQIuD6
         8rl0NBQ4hczCJr3CxE9Wnr22W3SiD9v0FS+HarFv44hgLtTR2LrDR/+IRKZTb+LjS2SB
         mllghl67c8huqWMRAlW9vxVIbnQZyoS9pHJLwQScVvjIDU5NZk9rcRG6mJZTtOJXbJz3
         HQj4NpG02IrtgCwkWaDO0m7C8ILR2eyy6209QCJWivhin0bRHAu2eT/gzSfE+UrPeUew
         MQ7a4teUjeZP2RhLQWGGb1gfUV0eW0VVND0ZpwKslQFiDCNLIVqPPL46Buv9mHh91apv
         pyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714731029; x=1715335829;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6hTusBcHi9YxURLdUO/WLl8txt8QQtV1zWj91AU31ts=;
        b=oC7pCxOp4ZZ2FTM9YNGQXJJOM1c50lX0YMzD8IV4PrOmi4JRItpbWMITBD7xVHVEO1
         p+bFO/Gn89GCxaP6fskUJsyiesuUm6g/ns5cIZsC0NjNvaitFcRtkBNHULWDhxk4hBDe
         l8e/9lSq7F3OiwTyGXT0oWSfo4CauHxuW/S5NfQXcICYjuPkVA3NFQI4tIFF4OsWIMvK
         0EuHbw2dE8wZl0D/VHFvNKG9hEHEZp1In3Y+HfHgbiGuABlHJeQpMhvM3sB6w1BjU8Nq
         EDHjeSTyy4RPETP9ayW5l51knLpYDqZ8UxyV5VXli3OfYVfMy9GZC55oHNH15tOaApsE
         Ht/Q==
X-Gm-Message-State: AOJu0YxFqS1qjNK7vpN4Ko9PdlraVFzyBtZ60QMdTKVpBhU67+8faUUM
	LGRcKB1Xz5W/MUoLAu9N5Qxflamf5m+fLsNbP1F16AO57DqCiQvXC6zXp2F2uQ==
X-Google-Smtp-Source: AGHT+IEjldV8dM6Mk24Eykv59A4quGmLQM1oMuK2rNayan+XPKnnuDSueH7CAf/NOkAcYTq3G2OJZQ==
X-Received: by 2002:adf:c6c2:0:b0:34c:b1a9:1816 with SMTP id c2-20020adfc6c2000000b0034cb1a91816mr2036149wrh.31.1714731029364;
        Fri, 03 May 2024 03:10:29 -0700 (PDT)
Message-ID: <83741df3-b951-4351-88c1-2b7bb7b1e16e@suse.com>
Date: Fri, 3 May 2024 12:10:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 1/3] drivers: char: address violation of MISRA C
 Rule 20.7
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 bertrand.marquis@arm.com, julien@xen.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1714487169.git.nicola.vetrini@bugseng.com>
 <3ae8aa13a5562440cf60e4b30f713e5b2f73c577.1714487169.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2405011257290.497719@ubuntu-linux-20-04-desktop>
 <25f8aec2da7e963f80c12e23fc5f725a@bugseng.com>
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
In-Reply-To: <25f8aec2da7e963f80c12e23fc5f725a@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.05.2024 09:29, Nicola Vetrini wrote:
> On 2024-05-01 21:57, Stefano Stabellini wrote:
>> On Tue, 30 Apr 2024, Nicola Vetrini wrote:
>>> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
>>> of macro parameters shall be enclosed in parentheses". Therefore, some
>>> macro definitions should gain additional parentheses to ensure that 
>>> all
>>> current and future users will be safe with respect to expansions that
>>> can possibly alter the semantics of the passed-in macro parameter.
>>>
>>> No functional chage.
>>>
>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>
>>
>>> ---
>>> Changes in v2:
>>> - drop excess parentheses from val parameter.
>>> ---
>>>  xen/drivers/char/omap-uart.c | 5 +++--
>>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/xen/drivers/char/omap-uart.c 
>>> b/xen/drivers/char/omap-uart.c
>>> index 03b5b66e7acb..e0128225f927 100644
>>> --- a/xen/drivers/char/omap-uart.c
>>> +++ b/xen/drivers/char/omap-uart.c
>>> @@ -48,8 +48,9 @@
>>>  /* System configuration register */
>>>  #define UART_OMAP_SYSC_DEF_CONF   0x0d   /* autoidle mode, wakeup is 
>>> enabled */
>>>
>>> -#define omap_read(uart, off)       readl((uart)->regs + 
>>> (off<<REG_SHIFT))
>>> -#define omap_write(uart, off, val) writel((val), (uart)->regs + 
>>> (off<<REG_SHIFT))
>>> +#define omap_read(uart, off)       readl((uart)->regs + ((off) << 
>>> REG_SHIFT))
>>> +#define omap_write(uart, off, val) writel(val, (uart)->regs + \
>>> +                                               ((off) << REG_SHIFT))
>>
>> the alignment looks off but could be fixed on commit
>>
> 
> Can you clarify what you mean here? I aligned readl and writeln and the 
> operands in writel to avoid the line being too long.

#define omap_write(uart, off, val) writel(val, \
                                          (uart)->regs + ((off) << REG_SHIFT))

The main point being that before you start splitting an argument following
another one on the same line, you'd move that argument to a new line.

Jan

