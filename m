Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B568A92BD
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 08:05:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707921.1106351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxKs8-000277-OK; Thu, 18 Apr 2024 06:03:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707921.1106351; Thu, 18 Apr 2024 06:03:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxKs8-00024s-K6; Thu, 18 Apr 2024 06:03:48 +0000
Received: by outflank-mailman (input) for mailman id 707921;
 Thu, 18 Apr 2024 06:03:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxKs7-00024m-C4
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 06:03:47 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a087263-fd49-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 08:03:45 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-418d1edcd4cso3413475e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2024 23:03:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 i9-20020a05600c354900b00418ee62b507sm161308wmq.35.2024.04.17.23.03.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Apr 2024 23:03:44 -0700 (PDT)
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
X-Inumbo-ID: 6a087263-fd49-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713420224; x=1714025024; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=svoMFNqiRsL9qO79yJc9DtsHHk+kA0oxf5Ls4pJpYIU=;
        b=EzQoVxNnjM02i8cB75uOdVyJwETGrFk1X8QC26juL3atuDkGBt6gAVEJAuCVwArQoc
         GJ4V5XJfvPABMFPwP1mCWYBYrzo6wlV7aMEjX1CgxUL4B0IRRcfLO44sp5jvUjxcuI6w
         h1DFpN/VVX3M9iw3I21FnXaABFe22ALnIuhA+PNOuuWfAaFs5nU6lTfwvJ5De2Qh9C0I
         k7/kGg2M3GXJEJPztYQ4SkE+qLw/FMFpXtdZ2rH2y8x28pA2x7CR03gQMYJy4jlfqZJF
         1qmoelf7aBvVG3FoV8oBXgog83tOEgiHSSvfTc/RsKiAo7W05LHGrSYpdG0ZlpCoDI8L
         /+RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713420224; x=1714025024;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=svoMFNqiRsL9qO79yJc9DtsHHk+kA0oxf5Ls4pJpYIU=;
        b=P6Iq9zqcaphRQS+EmtCVjraubV+eTzIxZ8FR+u8qawCmp/Hy0Z+0Z+IGSlM0LsCNxx
         1H5yTbUNFAqh7a6eEwFSg/LsXHm7mXrWtwJTmJuU4biIjwyDPQp6ngFe/ncpJYTtjw6+
         kbfoRuqDf9C4gkF0FmVIeSnMZqDCrgi74HiB32C2vNqXQecDjKF0wxksSHOtcL/RsPt0
         WhAB0wBJ2ok8H1xLcjBumJjR+bFqqm5A7XysAwfSHs+ONePP3JUwAhKjAH2PokCvRJ1u
         uqLJ//gcrGFAFMUoP+CL3rl3XhD8drcc/EvuTVPuqbJ9XerKHobJPuZ4j7TyOBUCjp/x
         C6ig==
X-Forwarded-Encrypted: i=1; AJvYcCVVoAd8ThECqYaREgUoo2Q10w8Ex14hsvhXbLlDCSYmGDDgDI3kMlV4RT0SWU2cqC3TGZ/CsFOn30fpIK+X5dPFB+DladnbPcCQaH/GQQA=
X-Gm-Message-State: AOJu0YwFrnvJmMYnMoxCysvuz1jNXrmsbzaZVb2lLnIs0E1X0zllRV25
	m9Ul8jkJVymVQGgF3C8jsg+/ssag9+cK8PMKRosH6uWRIh2GxfbM+L69XKMS9w==
X-Google-Smtp-Source: AGHT+IEne5M2xNICF36jI34kZu7iRBA03Z1i77FQPOvZ0moCjD2I9Vhdm88jkoyzTYI8Rh73IG3Vuw==
X-Received: by 2002:a05:600c:ccf:b0:418:ced:647a with SMTP id fk15-20020a05600c0ccf00b004180ced647amr1234290wmb.21.1713420224478;
        Wed, 17 Apr 2024 23:03:44 -0700 (PDT)
Message-ID: <1a2fc442-642c-4ee5-a00b-197836fd79b7@suse.com>
Date: Thu, 18 Apr 2024 08:03:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/19] xen/riscv: introduce atomic.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
 <6a6c4ef8663d9da8c8a2aba4baf0286f31566edf.1712137031.git.oleksii.kurochko@gmail.com>
 <3c939faa-98a5-4424-b405-b5c7c6c1c0b2@suse.com>
 <3ac34164e69f1983db3d4a66f62334497384958b.camel@gmail.com>
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
In-Reply-To: <3ac34164e69f1983db3d4a66f62334497384958b.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.04.2024 09:39, Oleksii wrote:
> On Mon, 2024-04-08 at 10:23 +0200, Jan Beulich wrote:
>> On 03.04.2024 12:20, Oleksii Kurochko wrote:
>>> +/*
>>> + * Only CONFIG_GENERIC_ATOMIC64=y was ported to Xen that is the
>>> reason why
>>> + * last argument of ATOMIC_FETCH_OP, ATOMIC_OP_RETURN isn't used.
>>> + */
>>> +#define ATOMIC_OPS(op, asm_op, c_op,
>>> unary_op)                          \
>>> +        ATOMIC_FETCH_OP( op, asm_op,       unary_op, w, int,  
>>> )        \
>>> +        ATOMIC_OP_RETURN(op, asm_op, c_op, unary_op, w, int,   )
>>> +
>>> +ATOMIC_OPS(add, add, +, +)
>>> +ATOMIC_OPS(sub, add, +, -)
>>> +
>>> +#undef ATOMIC_OPS
>>> +
>>> +#define ATOMIC_OPS(op, asm_op, unary_op) \
>>> +        ATOMIC_FETCH_OP(op, asm_op, unary_op, w, int,   )
>>> +
>>> +ATOMIC_OPS(and, and, +)
>>> +ATOMIC_OPS( or,  or, +)
>>> +ATOMIC_OPS(xor, xor, +)
>>
>> The + isn't really needed here as a macro argument; ATOMIC_OPS()
>> itself could
>> pass it to ATOMIC_FETCH_OP(). I also wonder why ATOMIC_OPS() has both
>> "op" and
>> "asm_op", when both are uniformly the same.
> It is needed for the case when sub operation is implemented using add
> plus negative number:
> +ATOMIC_OPS(sub, add, +, -)

Except there's no such case right here.

Jan

