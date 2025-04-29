Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EEEAA0A82
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 13:48:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972107.1360533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9jRS-0005YJ-9z; Tue, 29 Apr 2025 11:48:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972107.1360533; Tue, 29 Apr 2025 11:48:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9jRS-0005Vc-6v; Tue, 29 Apr 2025 11:48:02 +0000
Received: by outflank-mailman (input) for mailman id 972107;
 Tue, 29 Apr 2025 11:48:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qXnC=XP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9jRQ-0005Fs-OF
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 11:48:00 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca278d35-24ef-11f0-9ffb-bf95429c2676;
 Tue, 29 Apr 2025 13:47:55 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ac2963dc379so866408966b.2
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 04:47:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6e4f8835sm780031566b.67.2025.04.29.04.47.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 04:47:55 -0700 (PDT)
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
X-Inumbo-ID: ca278d35-24ef-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745927275; x=1746532075; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=x5IK1acPueM5diAUBx9pbIJZ6U+uTKNqCif5bhHu28s=;
        b=MmCNtlK1rTQkKM3/I0LJl7PBKc/46pK5lS+HFdpychTEESnNPPJ7C4tZmH165plLHe
         n+6AXWWkGziCN+sZLgQa8d29qMDSxSu8tW/37zeY/6IdDVWN6dt8iAaxQ0Yourn/wx5g
         OaBVQyuEQsK7WkyBcvr7tfZifyntyL1EzuabhI6lmkZO2bO7ZLzxjLgkI5Tiyx0yratE
         1g60J3LM34nnlm8fllujvWJyIUrPzRu+P7ho2XHs+OR5ubzgFc/YX4xWwu9bjOejhFPd
         y90vdD4QAnUcOeVL5ROrEvQa/iQBmo52M1aH13d6kGSS9gdjA392G3slfLFvlvpUPKZq
         yoWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745927275; x=1746532075;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x5IK1acPueM5diAUBx9pbIJZ6U+uTKNqCif5bhHu28s=;
        b=vQmqINBZJUyXKAqrASwYbBdz6uF7KlD9s6FtNmQK0iMN5O8qj4gtlT6uHNMLjFbFK9
         P+xSc8k2DL/C2vCpw6qyqx3ozHZxARd6xtb4f9L+fBsB2IkKwQiJ7itf9UVSABMSwIcv
         v5yKw9vGpMhz7UduRI9bVcQd6+uNk9dZ2i7R6L8H6PMVBY4bpikoADXfTMSh7eS8y9x1
         K3PxcL8qK5e8XCKdrGMkGJeNcmMVK6Vp7dTIqoj9W9BCHoU1vwv+szmN1Iqh09MGM68R
         jtvqp1PuCWafBwtO11IQYDr/q7vBtZioaqXXcfISAWED/LIcrfSssKWDfdaLmxfwfjMy
         h5CA==
X-Forwarded-Encrypted: i=1; AJvYcCUyvzJzPM5OStCv/A7gPBMSqGCg8dXHVkoeIH/rmqPAQ5o5Yd4w7TIvaKxBo0ptB2YVI+zb//oAdeM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwjZFr9jpCtu5sOn8yiRH2ydY5fdb30xxKRLpS0+luM9JSL6Oy/
	iTGjsjxYIWdApZaZrW21BX9+7Uy/vCAgTfhCFuUYxBC0B0PeuNu8Xt+LXECGPQ==
X-Gm-Gg: ASbGncvilwiCYCMvsFAkWVyJe3E43BktxdQSAHHcLBWp6u1wN3C+r5zXXreaF6TN5+i
	+S+jcXnv6eNMqlp4g9BAUozC+ZnhlEyayBNHrXub8F0CoxxbgAbxIpPa3O4JuAIODmfg3HaO8h9
	9RM/WeO+b+tVw610LubSEXZqb5ndKqi6SgymvTE7W2eAbuRBu7mPdVvusRbc6zDJcHI+iOrEg5e
	pOH1FUBjKDD7utYisHrB+RNdpK7bLpt/k93/+I1g0tRnZltj/cMpCCdVCqwrBJ6pPpZdxDMKPJt
	jKUJhb6sj+8U4lO5LPFS1pGyTG4r/eLu+w4W+dWLioEFylUS4OOecu8eZoP9+/gMxGRCMwytMi3
	X6z7etbYsMrDrldC4KZq+NQCGRXLOdazt6L0p
X-Google-Smtp-Source: AGHT+IENpQ+fNHEFuEvEeIazG+f8/yTD1nJebgQxzNGY6BsYfbuAMp4qnvhNaTDLvGFmBCmR6a8LFQ==
X-Received: by 2002:a17:907:6d21:b0:abf:7636:3cab with SMTP id a640c23a62f3a-ace8493b5damr1238084466b.29.1745927275287;
        Tue, 29 Apr 2025 04:47:55 -0700 (PDT)
Message-ID: <d508e514-6900-4c1d-a14d-bae68c4ba61e@suse.com>
Date: Tue, 29 Apr 2025 13:47:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] xen/io: provide helpers for multi size MMIO
 accesses
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250429101252.50071-1-roger.pau@citrix.com>
 <20250429101252.50071-2-roger.pau@citrix.com>
 <08d550d4-2283-4177-b812-fd87c0fa511d@suse.com>
 <aBCt8lb-2X75-wqF@macbook.lan>
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
In-Reply-To: <aBCt8lb-2X75-wqF@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.04.2025 12:46, Roger Pau Monné wrote:
> On Tue, Apr 29, 2025 at 12:23:05PM +0200, Jan Beulich wrote:
>> On 29.04.2025 12:12, Roger Pau Monne wrote:
>>> Several handlers have the same necessity of reading or writing from or to
>>> an MMIO region using 1, 2, 4 or 8 bytes accesses.  So far this has been
>>> open-coded in the function itself.  Instead provide a new set of handlers
>>> that encapsulate the accesses.
>>>
>>> Since the added helpers are not architecture specific, introduce a new
>>> generic io.h header.
>>>
>>> No functional change intended.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> preferably with ...
>>
>>> @@ -5185,6 +5167,7 @@ int cf_check mmio_ro_emulated_write(
>>>      struct x86_emulate_ctxt *ctxt)
>>>  {
>>>      struct mmio_ro_emulate_ctxt *mmio_ro_ctxt = ctxt->data;
>>> +    unsigned long data = 0;
>>
>>
>> ... this moved ...
>>
>>> @@ -5195,9 +5178,12 @@ int cf_check mmio_ro_emulated_write(
>>>          return X86EMUL_UNHANDLEABLE;
>>>      }
>>>  
>>> -    if ( bytes <= 8 )
>>> +    if ( bytes <= sizeof(data) )
>>> +    {
>>> +        memcpy(&data, p_data, bytes);
>>>          subpage_mmio_write_emulate(mmio_ro_ctxt->mfn, PAGE_OFFSET(offset),
>>> -                                   p_data, bytes);
>>> +                                   data, bytes);
>>> +    }
>>
>> ... into this more narrow scope.
> 
> Hm, but if I move it I can no longer use sizeof(data) in the condition
> check, that's why data is defined in the outside.

Oh, I didn't pay attention to that. Yes - please keep as you have it.

Jan

