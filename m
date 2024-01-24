Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AD483A412
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 09:23:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670764.1043755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSYXc-00051j-Ly; Wed, 24 Jan 2024 08:23:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670764.1043755; Wed, 24 Jan 2024 08:23:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSYXc-0004zh-Iq; Wed, 24 Jan 2024 08:23:24 +0000
Received: by outflank-mailman (input) for mailman id 670764;
 Wed, 24 Jan 2024 08:23:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bgOV=JC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSYXb-0004zS-3X
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 08:23:23 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d592c1a7-ba91-11ee-9b0f-b553b5be7939;
 Wed, 24 Jan 2024 09:23:21 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2cf206e4d56so3357041fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 00:23:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 b17-20020a026f51000000b0046ebc973227sm3301326jae.147.2024.01.24.00.23.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 00:23:20 -0800 (PST)
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
X-Inumbo-ID: d592c1a7-ba91-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706084601; x=1706689401; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kQWS33Fiea3Nb95RU7aDCCT7AN5Bju0X0QtjG/gLrkI=;
        b=cg6G+zgkqgfUuiH04HzsRbdZsvyvBlWN4icQhs3UnfwdN1j1C1PptvCgvFm+uy8otH
         fhbxbHcP3O9XTH5USp4eJ/odT3Ee6dPd1izJjYbA1vS+X7mRrdLpBBAVPuiFaCzhAR7l
         VdLH42uCkPsnvc4lW8W/Ed8U2ehZZQLXDU5igG6PSeyEXy1W7LfYv/pgs8n4JYlLEk3e
         1gS2P3PTNgmdqN/rpl8qBj26gSewROiO2oSAvyTfDEinKdbvjvXfZ4oqRX+naxIXaOBO
         06qaDifJQDQ3H1SeJXXC5BubmzSsdLw6mzxGj7upxKHlGvkejMrcbALeIRqNeLvPDrV9
         zuKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706084601; x=1706689401;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kQWS33Fiea3Nb95RU7aDCCT7AN5Bju0X0QtjG/gLrkI=;
        b=YY4exFbcuaLueQRx85NId8XpSHO4YVl4l64blGhRHa91nMiq00GMxq1/GbQYYyVu+m
         RFRMcoxi3RnBhHEHlwz/qvnsoP9gBuPYuRns/bVSAqFTcB9Fk2RfjQz2OQ/A5WDaQ127
         r0x6Pzc7p7UFVQYz17F8hUpQy5PejLsAPQiviob7ZYD/Y38mEmytbeGANpTG3RBWrhav
         hO+guZCTG59szIFX0KzgeB2mmZUKkN3jYXaQePhgLosuv+Y6pyxWi9ko8+230G+42LPM
         bwcSjH4HSU4wUXl0CbJcPZNsGOuBkIlyL60tkpAqwqyACvpNr0P9KfNgIdvbIlLcUbss
         rD2A==
X-Gm-Message-State: AOJu0Yw1wH+zBwR6egJFNDmeAIvct0pEpdRQ63TosV8omF7G6lpj8HGM
	RWKI80EWiv9exDYjCQ+omhQZnD2cD1qi4/vfBwtmQWotzyLPI8xA3c+o5oM26mmpDjiz5utHqeU
	=
X-Google-Smtp-Source: AGHT+IFEzP4wFIIJ/hILEMqS/7sBmRs1+eSkOv7e1HRdQDZaEhfTHrx/Y6qafHI92obxcE3L8qLFBA==
X-Received: by 2002:a2e:b889:0:b0:2cf:1c9c:a43b with SMTP id r9-20020a2eb889000000b002cf1c9ca43bmr438612ljp.18.1706084600782;
        Wed, 24 Jan 2024 00:23:20 -0800 (PST)
Message-ID: <bb1bcfe9-333f-4e7b-b4a8-3d376931985e@suse.com>
Date: Wed, 24 Jan 2024 09:23:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 31/34] xen/riscv: add minimal stuff to mm.h to build
 full Xen
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
 <4411f6af38586074b347cd6005f19f9c670faa74.1703255175.git.oleksii.kurochko@gmail.com>
 <d347c4d9-e93b-4937-8e33-e5fbbdcd6bfb@suse.com>
 <7ba286f9f1255cbf5c0957f0a0a92e5e18f2bc8d.camel@gmail.com>
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
In-Reply-To: <7ba286f9f1255cbf5c0957f0a0a92e5e18f2bc8d.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.01.2024 18:27, Oleksii wrote:
> On Tue, 2024-01-23 at 14:03 +0100, Jan Beulich wrote:
>> On 22.12.2023 16:13, Oleksii Kurochko wrote:
>>> +#define _PGC_extra        PG_shift(10)
>>> +#define PGC_extra         PG_mask(1, 10)
>>> +
>>> +#define is_xen_heap_page(page) ((page)->count_info & PGC_xen_heap)
>>> +#define is_xen_heap_mfn(mfn) \
>>> +    (mfn_valid(mfn) && is_xen_heap_page(mfn_to_page(mfn)))
>>> +
>>> +#define is_xen_fixed_mfn(mfn)                                   \
>>> +    ((mfn_to_maddr(mfn) >= virt_to_maddr(&_start)) &&           \
>>> +     (mfn_to_maddr(mfn) <= virt_to_maddr((vaddr_t)_end - 1)))
>>
>> Why does _start need prefixing wuth & and _end prefixing with a cast?
>> First and foremost both want to be consistent. And then preferably
>> with as little extra clutter as possible.
> This is how it was defined in Arm. I think it both can be casted.
> I'll update that.

Judging from your present use of virt_to_maddr(&_start), I'd assume
you're fine without casts. And when casts aren't needed, they're
better avoided.

Jan

