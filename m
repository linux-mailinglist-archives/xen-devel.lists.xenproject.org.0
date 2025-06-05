Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC690ACF241
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 16:43:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006978.1386237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNBoA-00082i-NX; Thu, 05 Jun 2025 14:43:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006978.1386237; Thu, 05 Jun 2025 14:43:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNBoA-0007zb-KJ; Thu, 05 Jun 2025 14:43:06 +0000
Received: by outflank-mailman (input) for mailman id 1006978;
 Thu, 05 Jun 2025 14:43:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uNBo9-0007zV-4F
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 14:43:05 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62e9bdf7-421b-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 16:43:04 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a5096158dcso904768f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 07:43:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747afe96776sm12928282b3a.24.2025.06.05.07.42.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 07:43:02 -0700 (PDT)
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
X-Inumbo-ID: 62e9bdf7-421b-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749134583; x=1749739383; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ibQZ3gmRDP/C5LX0XwMwRHmURZDY2RPqf/5UEeuDWF4=;
        b=g1nloAfumUkxkzUg+AlVuQjyWzrMkaxCqebkmQZGiaAD2xPqc2MroG+MVVaEv6VMn+
         1HF+kcQauWZgYDKIeKXo8cCiQqBMnSEcpTB9D4UK1jnF+4Q7PIR557LGsals27Uear04
         7/oCeztcK3bDFWqbN1sy1ErsiM90WRmB6Jj4BE6SWpZ3ZdP9mY0EYp2E0m+mpHhdkunA
         76pJZJkNdAHtX7mN8opISCe2+wnlkAxP05MMa8K6mOjKAI6kvK5UH+VAjj4SrUsVIpNb
         XtTqvNo9TyMofVdqGCkqdndq6Djc13Ms7bh3zkiZkE8pArg9eVM48NqmJDP679VHT7SQ
         n48g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749134583; x=1749739383;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ibQZ3gmRDP/C5LX0XwMwRHmURZDY2RPqf/5UEeuDWF4=;
        b=ctIllGxFB8W18v4T+IQhzDZ7Dh/aY8UQJHvSA55LavY3sRUXyd1uOw9ChSFpYR8+Uh
         wq6RsJN6HIbmNfj9IWubjvMoygePxb/RDW5cF1EtiiuG7jzXI4JkMm4BLkMR/fpYcska
         ZDkEWxmLw+sY/bVSLJgEMfoM58ox83G8U7aLQovq4FfIcj8dPyf9b32CSWDxn/avvyU2
         IgiZBqNAN2uaPeyBpLNt2xMCN4E71ICd91yY2+9Sg5/jvQp7opzDtgC5wPXIDufSb0X9
         uviGPoavUqEIp3f73AQNNUnVXcCnuRn/mVdYBheSYGS5IXnXHHzxDZ2H9ATr3eqQ2u2L
         OO0w==
X-Gm-Message-State: AOJu0YyxCKhZs5Z+Sy3QHOR9gC9FZj/EPvg+YV0q34tDN8hDgSn57lxp
	/Fc0IjBjU4b+ks8BD0qiu0wqsdjcOZE8MF7zF/sLiYs3v1tVGrmFL1VrDHo2lqe/xg==
X-Gm-Gg: ASbGncsRohQz4w9BmuoSx8D+hiKsuAx0/FZT5FzHteBojG9yX9UjRnRprgcMe6Mrr2R
	ZHYFNgYCCEIA7pVbMpa1fCeK4Q0x6O9ACX4bv8G18+Uz2VXZSzEGUd+RmF+OyjBkKS6kFqdtWWP
	PG+FCOUEOBbRWa4eOAzJvTOBn3o/zMPhjIPEeaPON9//Lhs+3J423VqvLSnAc6m4UhG/7Bysl1s
	ZFn7dMERLBSODc41fBkQjwVo6iK4Wi60EZ6JHsPBcHBpUIUhkt/8Z+21FcvO7l43P2OUQz3lebd
	ZpmOiHuI2uH1zKyWTE6yfNXyXZLpbhgWRbb/arQjApUa6lT4F21R4FaCGhbIbI7NL4h4EaCQkgN
	inBjCWMBCLzHLDXIXs0TceGfD4eVOD0fCikuq
X-Google-Smtp-Source: AGHT+IGFy0saGtFzDkmF5bygd+mwqObeMCE3jXb4prcd07GReP708S1nJyCWwNZN4S07Uruyzu8A2w==
X-Received: by 2002:a05:6000:40c7:b0:3a4:e6e7:3acd with SMTP id ffacd0b85a97d-3a51d934705mr6058527f8f.18.1749134583435;
        Thu, 05 Jun 2025 07:43:03 -0700 (PDT)
Message-ID: <66cfdee6-5dc2-4139-8550-ef441fa7a7a0@suse.com>
Date: Thu, 5 Jun 2025 16:42:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/5] console: add relocation hook
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.defc562b917978814c8359bbd04f1dadba33fb77.1748182535.git-series.marmarek@invisiblethingslab.com>
 <4f1889dc03ec4aa2cc0cd2bd14523a2c6f670bdb.1748182535.git-series.marmarek@invisiblethingslab.com>
 <0b17da9c-57db-4a8b-90af-e53e45cb1243@citrix.com> <aDSLNeFRZWoxMTEt@mail-itl>
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
In-Reply-To: <aDSLNeFRZWoxMTEt@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.05.2025 17:39, Marek Marczykowski-Górecki wrote:
> On Mon, May 26, 2025 at 04:08:17PM +0100, Andrew Cooper wrote:
>> On 25/05/2025 3:15 pm, Marek Marczykowski-Górecki wrote:
>>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>>> index 25189541244d..3ef819a252e4 100644
>>> --- a/xen/arch/x86/setup.c
>>> +++ b/xen/arch/x86/setup.c
>>> @@ -1481,6 +1481,8 @@ void asmlinkage __init noreturn __start_xen(void)
>>>          highmem_start &= ~((1UL << L3_PAGETABLE_SHIFT) - 1);
>>>  #endif
>>>  
>>> +    console_init_pre_relocate();
>>> +
>>>      /*
>>>       * Iterate backwards over all superpage-aligned RAM regions.
>>>       *
>>> @@ -1606,6 +1608,12 @@ void asmlinkage __init noreturn __start_xen(void)
>>>      if ( !xen_phys_start )
>>>          panic("Not enough memory to relocate Xen\n");
>>>  
>>> +    /*
>>> +     * Notify console drivers about relocation, before reusing old Xen's
>>> +     * memory.
>>> +     */
>>> +    console_init_post_relocate();
>>> +
>>
>> With reference to the next patch, there are printk()'s in this region
>> which want to work (in case something goes very wrong), so I don't think
>> setting dbc->suspended is the best approach.
> 
> I guess the post_relocate hook might be moved a bit earlier, but still,
> once relocation happens, the xhci console is not functional until it
> gets relocated too (for example - it would post new TRBs into a ring
> that isn't actually monitored by the controller).

Why is it that this ring is dependent upon Xen's position? If the ring was
dynamically allocated, it wouldn't change position when Xen is moved.

Jan

