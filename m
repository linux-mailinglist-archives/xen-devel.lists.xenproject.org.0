Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD03849C92
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 15:05:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676125.1052006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWzbB-0003f8-FH; Mon, 05 Feb 2024 14:05:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676125.1052006; Mon, 05 Feb 2024 14:05:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWzbB-0003cs-Bg; Mon, 05 Feb 2024 14:05:25 +0000
Received: by outflank-mailman (input) for mailman id 676125;
 Mon, 05 Feb 2024 14:05:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8/S5=JO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rWzb9-0003cm-Hq
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 14:05:23 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99562ea2-c42f-11ee-8a45-1f161083a0e0;
 Mon, 05 Feb 2024 15:05:22 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40fc52c2ae4so29014335e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 06:05:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 p4-20020a5d4e04000000b0033b3ceda5dbsm2367341wrt.44.2024.02.05.06.05.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 06:05:20 -0800 (PST)
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
X-Inumbo-ID: 99562ea2-c42f-11ee-8a45-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707141921; x=1707746721; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ngGvdTM+gCWTGJaPodlHCVbpAEcmrptnfv2LPQTxfYc=;
        b=d/YXxRTGgWOwCsc6s4yRt5xziPLNxzXegu6VA9HJJk3E4ZL3Ga6VS+Uw8GAnBtp6IC
         5KsrnMsh9mfYN7/iVgucjCuBRX3ZBY8cdDCk8IhN+zsVJBOXgqAIPeebQvooQiOUlXZZ
         ICMOHWEJzqraQMG0hZAvSwpGMDwXsvsUNLLHjVZaUCJoeAPazYU1qWsx9PLP3QuCjUXh
         HDV+pibjUw7JDgkkf/5N6oY19NUgdE28WgEnE4HdiB6UT6VMtTSuYEpOSY1QnGz0j+K3
         sJgRI/gRFQszoEQL1b3D98EhmcRAWgBRL7laac5oPQ/c2mzyr6A7jiqE5CLLVHsm1q07
         A6jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707141921; x=1707746721;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ngGvdTM+gCWTGJaPodlHCVbpAEcmrptnfv2LPQTxfYc=;
        b=Fp02stL7yvNQZaO1RNwc+7KmZlQ0aDtQ6R4KEqOJ3D4DWGVa+VrCERo4JoaEw5CTCF
         W6PO7OoL4L7KwNyFGbai+kkKUjRxoVrWazeMtDug0qFqOP6zf68hIN/EAiEzEZZh0VTM
         zK5/NpYMzLCBw/lf5B1bFeu9bxb4U89MZnRs/SZk2tjVUcUYVNzshECOUQbcFw0Y9AcA
         3sAB3DKdVBd4Kl3iRhPtVOsiGDA6IM94vLujyA6C+hkeczWwGh3ymAxJBJD+lGvfBqMK
         s5G2rLNGoV5EJak+0YWma5Hn7gqZsz/8ITosh4Sm8PkbNKr1Xi+wGRZ6mKTnYpU7TS1s
         VOmA==
X-Gm-Message-State: AOJu0Yyu8DdZfbIUhhBWGpCyf9PpOi8NKWp0qZfjP0NlV66GZnqR6cKH
	AjCIDj6eegxSGxb5IfJLV1nZzYoj8eN6O3pJDJvGZTZ4tjjDzfyxM2ccKzE4hg==
X-Google-Smtp-Source: AGHT+IHfJYlcae+Bt1kKIZMeJZjsKkMR12d10EsaZDT9hPt3lzAJT0OZ8Q1p/g/PPu05A/y5kAuatA==
X-Received: by 2002:a05:600c:4ed2:b0:40f:dd0e:1ed3 with SMTP id g18-20020a05600c4ed200b0040fdd0e1ed3mr1351733wmq.28.1707141920811;
        Mon, 05 Feb 2024 06:05:20 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXDiYRclsbruPeGzd9FReUxd0ATFLcLR4CvNfwa9bJc/7RtEdVIjIhEROgv4iwTguayoRFL52DRloG4D7iZJTO7gqRHp23nNy3Lx0mviijZBFtM/biAW/xnKY089NWG+jnqYIFT+oq46GIZAOnxW8D2t8gUtcn3/+0RqRLrpEvaRXLDBEAJAhyPEbtw1sDvHMuOeNqHojIlVviVBYl582lnxc9pHBlD7lXdvshz17N9rP4QrYteK0eLz1f25P8yRQl0lQmJFcYpfX9iVEcewMDICUXwFG7eJ6Zf8LQIdNvZjE5D5xtffuc=
Message-ID: <8b71122a-8446-4619-992e-ec2475e602d0@suse.com>
Date: Mon, 5 Feb 2024 15:05:19 +0100
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
 <f3858360fba14a2c5b794bdd0400cd7ab8e66f73.camel@gmail.com>
 <44a9a92c-ac4c-43d0-bc1e-685818e4331d@suse.com>
 <211e7d7fb7d52d0bc7dbb12d5619a39f98d5b21c.camel@gmail.com>
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
In-Reply-To: <211e7d7fb7d52d0bc7dbb12d5619a39f98d5b21c.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.02.2024 13:49, Oleksii wrote:
> On Mon, 2024-02-05 at 08:46 +0100, Jan Beulich wrote:
>> On 02.02.2024 18:30, Oleksii wrote:
>>> On Tue, 2024-01-23 at 14:03 +0100, Jan Beulich wrote:
>>>> On 22.12.2023 16:13, Oleksii Kurochko wrote:
>>>>> +/* Convert between Xen-heap virtual addresses and page-info
>>>>> structures. */
>>>>> +static inline struct page_info *virt_to_page(const void *v)
>>>>> +{
>>>>> +    BUG();
>>>>> +    return NULL;
>>>>> +}
>>>>> +
>>>>> +/*
>>>>> + * We define non-underscored wrappers for above conversion
>>>>> functions.
>>>>> + * These are overriden in various source files while
>>>>> underscored
>>>>> version
>>>>> + * remain intact.
>>>>> + */
>>>>> +#define virt_to_mfn(va)     __virt_to_mfn(va)
>>>>> +#define mfn_to_virt(mfn)    __mfn_to_virt(mfn)
>>>>
>>>> Is this really still needed? Would be pretty nice if in a new
>>>> port we
>>>> could get to start cleanly right away (i.e. by not needing per-
>>>> file
>>>> overrides, but using type-safe expansions here right away).
>>> We still need __virt_to_mfn and __mfn_to_virt as common code use
>>> them:
>>>  * xen/common/xenoprof.c:24:#define virt_to_mfn(va)
>>> mfn(__virt_to_mfn(va))
>>
>> Are you meaning to enable this code on RISC-V.
> Yes, that is what I meant.

And why would you do that? Even Arm doesn't use it, and I'd expect no
newer port would care about this very old interface.

Jan

