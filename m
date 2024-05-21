Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D94DA8CAD2A
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 13:11:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726834.1131209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9NOH-00027k-Dg; Tue, 21 May 2024 11:10:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726834.1131209; Tue, 21 May 2024 11:10:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9NOH-00025L-At; Tue, 21 May 2024 11:10:45 +0000
Received: by outflank-mailman (input) for mailman id 726834;
 Tue, 21 May 2024 11:10:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TLq1=MY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s9NOG-00025F-3O
 for xen-devel@lists.xenproject.org; Tue, 21 May 2024 11:10:44 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2d94469-1762-11ef-b4bb-af5377834399;
 Tue, 21 May 2024 13:10:41 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-572a93890d1so9472623a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 May 2024 04:10:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c7d14sm1599411566b.130.2024.05.21.04.10.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 May 2024 04:10:40 -0700 (PDT)
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
X-Inumbo-ID: c2d94469-1762-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716289841; x=1716894641; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RowLZQ7QNS+dIfDO2vpYQHhf0HXk41FQllbMwLSDpVs=;
        b=DevbnG0B4yqq1PjIf+w4Y0qWBzHwrqu97jwExxsNyfb/4GrKZiG/hqVTavkj/qyEy+
         FuXbh7Dv0sQ7F3ogV3r7Hm8Oy+3NtmfncWPN0qzKEu2HmpSpLvSqLTUio0nZrsKIsmJv
         lPcQvPmupeGFBOkL6l7iz8IwnKYTTjX8kt0CONH+3ayNX2gpuUfj2ZXPeYqiOl4ENo2K
         hSQu0v1mdCo/Pzvv9dg+zoOqfXsW3OKiHHut8b4LsQIgg9mvK95n9D+8vXAOBp2ZvPr4
         I/0s/waj9spcC6/b3bTMhk6uv24HdchWQQUxU0WxONUXbtBJZ+X6ymncc4N3rXctxJ8H
         UEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716289841; x=1716894641;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RowLZQ7QNS+dIfDO2vpYQHhf0HXk41FQllbMwLSDpVs=;
        b=CEpr9l7dG+NoKVSnY5tkPocLHidGBMqwMrTE9O+yxD+xrmc/ZwBrfNqttXIcQAfnqb
         X16pbLxqNvGyXTwtOx/b6/YMfWoZizCgPXifqjYwKwxXfQ/H1SCO3La/nSqjsk2O3RsH
         4U64YJm87k0y9TPiCoFtfU3YPmE9DUcaXeFC0yareUzF5pzCx/cbbmYqUecfGVynSyJh
         DjoBPo4Pq4Yj+uGaEBs0sYvGk+4CEd8T42iLwZ7ZwsTVD+1nlMary9zVATp12RiouaAC
         i/T84Z2nFPxXjHpUdI/4Zel7FBphllr16DMXBUDTyMvE1uXYnUyBgaNLf3AUn2iBjr+T
         fZlw==
X-Forwarded-Encrypted: i=1; AJvYcCXEO8rkhwYdGJfhMSuZgUnM8HMIGUz+yZK6cA/512r4q5n3Af/P4lD5KiRAc8c2806B7qymwR2HmWY4jZNFhNzyqWIVSPjPJ2TDyQmN5LQ=
X-Gm-Message-State: AOJu0YzMofsH5aaFXLwx/FWml08jXlSibhv6rj0YEpD1ar/zcBevxfEX
	oXp3zEOXaSgJr/1e9puMi7wGo81Lw97i0rGZOfOrbkkMQfQlj4jKoqS4zd7ZfQ==
X-Google-Smtp-Source: AGHT+IHHH7xGkHcklLxFeb2TpeBRJtaQOXTq50OzQ6JOZ2PMqfEbLDri4KYAJF7kMC81GrbX947Kzw==
X-Received: by 2002:a17:906:ae50:b0:a59:c3a5:4df0 with SMTP id a640c23a62f3a-a5a2d53b0bbmr3215910366b.4.1716289841147;
        Tue, 21 May 2024 04:10:41 -0700 (PDT)
Message-ID: <54821721-0d29-487d-b346-9dda52f339dd@suse.com>
Date: Tue, 21 May 2024 13:10:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 02/14] xen: introduce generic non-atomic test_*bit()
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1715952103.git.oleksii.kurochko@gmail.com>
 <219df9d840a183fc55de02aff011c0972a68587c.1715952103.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <219df9d840a183fc55de02aff011c0972a68587c.1715952103.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.05.2024 15:54, Oleksii Kurochko wrote:
> The following generic functions were introduced:
> * test_bit
> * generic__test_and_set_bit
> * generic__test_and_clear_bit
> * generic__test_and_change_bit
> 
> These functions and macros can be useful for architectures
> that don't have corresponding arch-specific instructions.
> 
> Also, the patch introduces the following generics which are
> used by the functions mentioned above:
> * BITOP_BITS_PER_WORD
> * BITOP_MASK
> * BITOP_WORD
> * BITOP_TYPE
> 
> The following approach was chosen for generic*() and arch*() bit
> operation functions:
> If the bit operation function that is going to be generic starts
> with the prefix "__", then the corresponding generic/arch function
> will also contain the "__" prefix. For example:
>  * test_bit() will be defined using arch_test_bit() and
>    generic_test_bit().
>  * __test_and_set_bit() will be defined using
>    arch__test_and_set_bit() and generic__test_and_set_bit().
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one remaining nit (can be adjusted while committing, provided other
necessary acks arrive):

> --- a/xen/include/xen/bitops.h
> +++ b/xen/include/xen/bitops.h
> @@ -65,10 +65,141 @@ static inline int generic_flsl(unsigned long x)
>   * scope
>   */
>  
> +#define BITOP_BITS_PER_WORD 32
> +typedef uint32_t bitop_uint_t;
> +
> +#define BITOP_MASK(nr)  ((bitop_uint_t)1 << ((nr) % BITOP_BITS_PER_WORD))
> +
> +#define BITOP_WORD(nr)  ((nr) / BITOP_BITS_PER_WORD)
> +
> +extern void __bitop_bad_size(void);
> +
> +#define bitop_bad_size(addr) (sizeof(*(addr)) < sizeof(bitop_uint_t))
> +
>  /* --------------------- Please tidy above here --------------------- */
>  
>  #include <asm/bitops.h>
>  
> +/**
> + * generic__test_and_set_bit - Set a bit and return its old value
> + * @nr: Bit to set
> + * @addr: Address to count from
> + *
> + * This operation is non-atomic and can be reordered.
> + * If two examples of this operation race, one can appear to succeed
> + * but actually fail.  You must protect multiple accesses with a lock.
> + */
> +static always_inline bool
> +generic__test_and_set_bit(int nr, volatile void *addr)
> +{
> +    bitop_uint_t mask = BITOP_MASK(nr);
> +    volatile bitop_uint_t *p = (volatile bitop_uint_t *)addr + BITOP_WORD(nr);
> +    bitop_uint_t old = *p;
> +
> +    *p = old | mask;
> +    return (old & mask);
> +}
> +
> +/**
> + * generic__test_and_clear_bit - Clear a bit and return its old value
> + * @nr: Bit to clear
> + * @addr: Address to count from
> + *
> + * This operation is non-atomic and can be reordered.
> + * If two examples of this operation race, one can appear to succeed
> + * but actually fail.  You must protect multiple accesses with a lock.
> + */
> +static always_inline bool
> +generic__test_and_clear_bit(int nr, volatile void *addr)
> +{
> +    bitop_uint_t mask = BITOP_MASK(nr);
> +    volatile bitop_uint_t *p = (volatile bitop_uint_t *)addr + BITOP_WORD(nr);
> +    bitop_uint_t old = *p;
> +
> +    *p = old & ~mask;
> +    return (old & mask);
> +}
> +
> +/* WARNING: non atomic and it can be reordered! */
> +static always_inline bool
> +generic__test_and_change_bit(int nr, volatile void *addr)
> +{
> +    bitop_uint_t mask = BITOP_MASK(nr);
> +    volatile bitop_uint_t *p = (volatile bitop_uint_t *)addr + BITOP_WORD(nr);
> +    bitop_uint_t old = *p;
> +
> +    *p = old ^ mask;
> +    return (old & mask);
> +}
> +/**
> + * generic_test_bit - Determine whether a bit is set
> + * @nr: bit number to test
> + * @addr: Address to start counting from
> + */
> +static always_inline bool generic_test_bit(int nr, const volatile void *addr)
> +{
> +    bitop_uint_t mask = BITOP_MASK(nr);
> +    const volatile bitop_uint_t *p =
> +                        (const volatile bitop_uint_t *)addr + BITOP_WORD(nr);

Indentation is odd here. Seeing that the line needs wrapping here, it would
imo want to be

    const volatile bitop_uint_t *p =
        (const volatile bitop_uint_t *)addr + BITOP_WORD(nr);

(i.e. one indentation level further from what the start of the decl has).

Jan

