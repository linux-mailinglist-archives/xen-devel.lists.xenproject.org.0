Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 076E3898A98
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 17:02:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700936.1094784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsOav-00077T-PY; Thu, 04 Apr 2024 15:01:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700936.1094784; Thu, 04 Apr 2024 15:01:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsOav-000757-Mk; Thu, 04 Apr 2024 15:01:37 +0000
Received: by outflank-mailman (input) for mailman id 700936;
 Thu, 04 Apr 2024 15:01:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=stKz=LJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rsOat-00074t-Om
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 15:01:35 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a8c8e92-f294-11ee-afe5-a90da7624cb6;
 Thu, 04 Apr 2024 17:01:34 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2d6ff0422a2so13023361fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2024 08:01:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 i1-20020adfe481000000b003437ad152f9sm6538032wrm.105.2024.04.04.08.01.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Apr 2024 08:01:29 -0700 (PDT)
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
X-Inumbo-ID: 3a8c8e92-f294-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712242894; x=1712847694; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iciWvoMWm6Hky3ZL3SmXQslC45iXm5OocGa0ygPdmTg=;
        b=JraQp/dPJoGln4Nn1BmEztHbRFcEqrSr+rK7u50Vl/qmPWzz1ZwQmEYOC28Trzdckr
         z08I/tuDIVgUwFVNHEsR/zMJ7Ei4MGss6mgTa9r2UlyC5t5W0KojDv515rdfSQFXZyPl
         yTZHjWoyiuVL0vJcZvy/X+9wsqaRVGntLdw8CzpMtOwM1AR+kiUmXuvkGUX9+M47T+d7
         coa6kcf+G0ViTqLMPk/I4kjMWHEqgZXrFcBKIKWRGe4a0ifJpe19zST/mJrKYGE65Vy3
         J5O6ytww8RLXAA9QJQHZfuMyiSoSy7GodwGNIJYce987f/qWCbvh/nZ5QTxSVBDeXOjU
         /uDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712242894; x=1712847694;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iciWvoMWm6Hky3ZL3SmXQslC45iXm5OocGa0ygPdmTg=;
        b=r5rn+QMaI5OH+CIkSwPUeZEJWG8VS2UolzzzOZTBm2Wc16MgY+EL4fjYYUrj0UwFGd
         IKawHEf4p9UZOjID9Iw3vqAPt1Y3NKrZ97/pnyw+hxFRMr+nJvGVqZt2G245EBfKpYDC
         VjI1G1RwWn7pr/FCnu1fwIE+5EsLQHkd/rB/RGClFozQMAaEiZNrZmBogso3Y/coy4kt
         UDLK9deMLkoBZi5euIjhT426whw0KYytQpXglTPk0hPnNrCrBUAe2G5pYy0iVH/aOAjC
         ZMsoU6nr2Xx8we/F5bwUK9NXsBTxCY4MkBlRQ87sofdu9/86MrdfGpGM9cuETNqxZlh7
         +Tfg==
X-Forwarded-Encrypted: i=1; AJvYcCU0G/PK0mBqtcS1WKVn+ewRuAbaESqdvWgoa6Rk+VSAc575Plc7BzhVz/PEE7rTBG3EYyMkeXt2DawzeMF9LC0xba53jbetaMNfR8W8q5E=
X-Gm-Message-State: AOJu0YzcqxBfhtGDjm4STB7wILnX1caJMTjnGpufBv2+dehGIzDVxFDq
	Oo78ihcsrvc68pybnfhls9FeaCD0xfWrXL7S8D+3lBqe6M8eOzDVrn7P2oxlqA==
X-Google-Smtp-Source: AGHT+IGNI5M4NOQIm9h2DK/LDewW5XdPyxSeJCQWgFypVrzYEwIuzFdCvVOKgi14C9j+LM43+wuhpg==
X-Received: by 2002:a2e:b0cb:0:b0:2d8:4158:cbaa with SMTP id g11-20020a2eb0cb000000b002d84158cbaamr1890192ljl.7.1712242889680;
        Thu, 04 Apr 2024 08:01:29 -0700 (PDT)
Message-ID: <d315dda1-f89e-4028-9aa0-98b4e80c81fc@suse.com>
Date: Thu, 4 Apr 2024 17:01:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/19] xen/riscv: introduce cmpxchg.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
 <f0d836be5dbc04468a74cabf9b48a51921bf749b.1712137031.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <f0d836be5dbc04468a74cabf9b48a51921bf749b.1712137031.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.04.2024 12:20, Oleksii Kurochko wrote:
> +#define emulate_cmpxchg_1_2(ptr, old, new, lr_sfx, sc_sfx) \
> +({ \
> +    uint32_t *aligned_ptr; \
> +    unsigned long alignment_mask = sizeof(*aligned_ptr) - sizeof(*(ptr)); \
> +    uint8_t new_val_bit = \
> +        ((unsigned long)(ptr) & alignment_mask) * BITS_PER_BYTE; \
> +    unsigned long mask = \
> +        GENMASK(((sizeof(*(ptr))) * BITS_PER_BYTE) - 1, 0) << new_val_bit; \
> +    unsigned int old_ = (old) << new_val_bit; \
> +    unsigned int new_ = (new) << new_val_bit; \
> +    unsigned int old_val; \
> +    unsigned int scratch; \
> +    \
> +    aligned_ptr = (uint32_t *)((unsigned long)ptr & ~alignment_mask); \
> +    \
> +    asm volatile ( \
> +        "0: lr.w" lr_sfx " %[scratch], %[ptr_]\n" \
> +        "   and  %[old_val], %[scratch], %[mask]\n" \
> +        "   bne  %[old_val], %z[old_], 1f\n" \
> +        /* the following line is an equivalent to:
> +         *     scratch = old_val & ~mask;
> +         * And to elimanate one ( likely register ) input it was decided
> +         * to use:
> +         *     scratch = old_val ^ scratch
> +         */ \

I'm surprised this compiles without \-es inside the comment as well. Line
splicing happens ahead of comment recognition as per the spec.

Everything else okay-ish to me now, but I can't very well given an ack for
a patch depending on things that haven't been committed yet and may never be.

Jan

