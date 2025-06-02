Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDD2ACAC62
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 12:23:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003138.1382601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM2Ji-0008Ec-Pw; Mon, 02 Jun 2025 10:22:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003138.1382601; Mon, 02 Jun 2025 10:22:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM2Ji-0008C8-MU; Mon, 02 Jun 2025 10:22:54 +0000
Received: by outflank-mailman (input) for mailman id 1003138;
 Mon, 02 Jun 2025 10:22:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QAfa=YR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uM2Ji-0008C0-2T
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 10:22:54 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a90cd45-3f9b-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 12:22:53 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4508287895dso29961195e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 03:22:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506bd8e39sm67687625ad.58.2025.06.02.03.22.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 03:22:51 -0700 (PDT)
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
X-Inumbo-ID: 8a90cd45-3f9b-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748859772; x=1749464572; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uQL4P1bUoJSru1C+GIX/VDusUlL+lX9SnKz25o0UXWw=;
        b=XxAj6Hr+aPGXtK65H79pzVSq5R1hB1aXT0/vLRHmXH3BqYvTajrYi15Nvos/hSsXlj
         UJrVe8VKl/kArleoSL6aYJ2eXDohkTdncJVy0iiGjPfS1bGtyuFPZeQrFWlcX9lI1T1Z
         Oy/9v3wuow3N2Smc4idYn7iWvdxhep51tYwZYtxTj9FgUWtakd5hHd1lPAsxHNja3erp
         DNnnGsHIIE/n3NJfr2u7O+vf0XAaY2Xn4Z+nMNil4phaaY4vx9t6NCIjRj4wkNabWEzk
         G8uPgGJbl1QaCwq1O2rEfauk7kDCDK6MT/NtZkN5lzqb4kcBC7JzhAFtX+H1v5GwGKdM
         2Ptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748859772; x=1749464572;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uQL4P1bUoJSru1C+GIX/VDusUlL+lX9SnKz25o0UXWw=;
        b=tMgVGGsFiLjha6/mXI/94DIZhSPiypwj9a4cRlOE1kXk8jxTeNXOhIoUY7LKXZc3oP
         h9LrXjt6pHRFwKha7GgXIBZaNGA4krHFuhd1N3UyBkSyRz/Xe6h4DogT8vk5oxcLLrFA
         WGNbPC7tkiIuTGjfQ3d6R3YkrZqGqV0GUnX9GMi4+D4PadjpdSyO1DjVEvzLEE9n1qVf
         3lMnszSdetR1L21IBOUey3Asgt8WAmcoIciSMIhGgvHQ5XdFmD0yuAkJWYxGmmI4IxRq
         /Pzz3YnOHin5m0d6mf2mM9cyn6FUG4pn77iEDeo9mO6pvNOxzdpcV41aeYPioUoYBzX4
         JEug==
X-Forwarded-Encrypted: i=1; AJvYcCVpoqRlEjTXpOG0llLJWEvp7HhOc2SPDrUtEam4S9AyhwI0+VLaOehnXC+O5gahH7/qiEerOjDCSTs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwQ+T20FqjjfLINJ3VzXwF7B6WFrOxg/OY27aA9LCqrzpuCZyB2
	6kLDu7y3fdj7N58Pv2Fh8OD+ck4RsAvjdEfsH6NXabzS+rHHgSI83kerWTckY6WlPA==
X-Gm-Gg: ASbGnctjlzvvJ1QHd5xAN423qYK5wMkb2/KP4d5aT2evglHx12LQUeV81FHNwm519PY
	TDqjwOtNE9JZln6EPziENTWWat/dMWa0IkqR+Q2v0kw12tfI3fiShrXPzm+0yLiqxyVKxF0CvTK
	cWSF9iC2a/VwsR5wFtXTCWLRk6ZckPxc1C9y7YC0LKHbFFUsAXrv2SZwfLVwmkJW71YZRiqZPRn
	viFBpaoSuDy49fTrr2n2lfgabFrYV3o5Fce5WOq99YHSt9DbuBRtUUIRTvgxHAEEJMA4bb0B3+r
	U044rUhS+vKLoNr7YBRY4f3Ek6tgd1WHjaO8SBhOjkFEB2uTI7EX6AgjL82RAsM8+xgOPTF4sP+
	nibaxDpUNGF855vBvwJ8pInFJ/GIbshPXHnV5+Dq/iw9kgAA=
X-Google-Smtp-Source: AGHT+IEbjXtZctthCHASUU1OZYTXEhFgwIS7nghbPqb0c36sMOlAZCFUpiSi7nmZyfjUujkqoM4iCg==
X-Received: by 2002:a05:6000:26c2:b0:3a4:ce5c:5e8d with SMTP id ffacd0b85a97d-3a4eedb8adfmr14468096f8f.20.1748859772039;
        Mon, 02 Jun 2025 03:22:52 -0700 (PDT)
Message-ID: <9ab65452-497c-47b5-af18-92a7b2a86d9e@suse.com>
Date: Mon, 2 Jun 2025 12:22:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/14] xen/riscv: imsic_init() implementation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1747843009.git.oleksii.kurochko@gmail.com>
 <421dad1bbd014a2d7ff588af088eadbd56345dbe.1747843009.git.oleksii.kurochko@gmail.com>
 <ec429b9d-7e16-4d9a-86c6-a5fa557047b7@suse.com>
 <d7ef87e5-75e0-4cf3-be8c-7af6e18df5a3@gmail.com>
 <84c9f65a-b278-4be4-b053-5bfa410f9a97@gmail.com>
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
In-Reply-To: <84c9f65a-b278-4be4-b053-5bfa410f9a97@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.05.2025 13:30, Oleksii Kurochko wrote:
> 
> On 5/26/25 8:44 PM, Oleksii Kurochko wrote:
>>>> +    if ( !dt_property_read_u32(node, "riscv,guest-index-bits",
>>>> +                               &imsic_cfg.guest_index_bits) )
>>>> +        imsic_cfg.guest_index_bits = 0;
>>>> +    tmp = BITS_PER_LONG - IMSIC_MMIO_PAGE_SHIFT;
>>>> +    if ( tmp < imsic_cfg.guest_index_bits )
>>>> +    {
>>>> +        printk(XENLOG_ERR "%s: guest index bits too big\n",
>>>> +               dt_node_name(node));
>>>> +        rc = -ENOENT;
>>>> +        goto cleanup;
>>>> +    }
>>>> +
>>>> +    /* Find number of HART index bits */
>>>> +    if ( !dt_property_read_u32(node, "riscv,hart-index-bits",
>>>> +                               &imsic_cfg.hart_index_bits) )
>>>> +    {
>>>> +        /* Assume default value */
>>>> +        imsic_cfg.hart_index_bits = fls(*nr_parent_irqs);
>>>> +        if ( BIT(imsic_cfg.hart_index_bits, UL) < *nr_parent_irqs )
>>>> +            imsic_cfg.hart_index_bits++;
>>> Since fls() returns a 1-based bit number, isn't it rather that in the
>>> exact-power-of-2 case you'd need to subtract 1?
>> Agree, in this case, -1 should be taken into account.
> 
> Hmm, it seems like in case of fls() returns a 1-based bit number there
> is not need for the check:
>   (2) if ( BIT(imsic_cfg.hart_index_bits, UL) < *nr_parent_irqs )
> 
> We could do imsic_cfg.hart_index_bits = fls(*nr_parent_irqs - 1) (1) without
> checking *nr_parent_irqs is power-of-two or not, and then just leave the
> check (2).
> And with (1), the check (2) is only needed for the case *nr_parent_irqs=1, if
> I amn't mistaken something. And if I'm not mistaken, then probably it make
> sense to change (2) to if ( *nr_parent_irqs == 1 ) + some comment why this
> case is so special.
> 
> Does it make sense?

Can't easily tell; I'd like to see the resulting code instead of the textual
description.

Jan

