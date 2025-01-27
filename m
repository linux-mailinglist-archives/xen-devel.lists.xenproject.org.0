Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19ED9A1D5C4
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 13:07:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877806.1287948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcNtF-0003TM-H4; Mon, 27 Jan 2025 12:06:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877806.1287948; Mon, 27 Jan 2025 12:06:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcNtF-0003Rt-DS; Mon, 27 Jan 2025 12:06:53 +0000
Received: by outflank-mailman (input) for mailman id 877806;
 Mon, 27 Jan 2025 12:06:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O4xJ=UT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tcNtE-0003Rl-0J
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 12:06:52 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 300264e4-dca7-11ef-99a4-01e77a169b0f;
 Mon, 27 Jan 2025 13:06:49 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-aaee0b309adso601498866b.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 04:06:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab675e13694sm568130566b.24.2025.01.27.04.06.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 04:06:48 -0800 (PST)
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
X-Inumbo-ID: 300264e4-dca7-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737979609; x=1738584409; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ewLyMHBj2GQTajUyZhFuGS6aq8l0EoSKeIwuuGMQwqM=;
        b=a+QF5J6TiRo/52oLASVyTgCEaiVDk+/wgjkjFbbbbYoEKc1VMD/eeCGnluj2Y0iCMg
         GlH0JUpZ6PGUtQToftZc4gOZfFJVv1IKEkvLL2uov5n5kplaZRZjuHm+BCMgJVFQw2C5
         tzhMiGQwxio6zp/Nkot6hnssgDTVhiLNILU0HpKuv6O3FgDsbEZD1+kXBoxpJg8cZh4c
         lOS1QVvqVC3dxG9hiTEDub4EuQtR1iThf9xLxT97jj8jQDUksesa8TNeeQqZ5R+FHn4z
         /7FXX10YbtcZ8HzST2n34rGMl71CgpcooFcWFERk/X8DbAGuk8WhX7No2g+v4cfCfg9v
         KdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737979609; x=1738584409;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ewLyMHBj2GQTajUyZhFuGS6aq8l0EoSKeIwuuGMQwqM=;
        b=dgh2pkYgGcOp2MhjXdhVSUyWIArQ1pH9ZzKfFnql/KkzpWrrqkCLf95b1qthsHs6AI
         f6juAmvNsNvmrat0wmWRam1ki8Xr47ffqH4ylOTIfCH/hiAwwXcl6fkaHmAdeB08NdH7
         jkN2Vxk1RtYbSDC/QVOQppNGZEmVAYdbCwJ9r+rt6jo60vrS62ZK/8kNsJVBVpcLkKLc
         OLLHOk0T51QExSWqQayeaLqIqXcGZDBKg26xQsrj9uecFf0zr6DpxBuqnA8XWj3ht8m7
         ok/OwWYT3wXitEKROJHseiJOGz8nkvCTLCUMtmld0Kn6YCy3+ZGQOV5XwpGOIa/7PO5D
         qTsQ==
X-Gm-Message-State: AOJu0YwErFwIySmjz62n8R1DNu9BhW/WbL+xs6DXOgsXx5/AsT5+qPJo
	lIqhulKe0WzBpILf1dxcUvArLts2Zb+6QS1LdfZteGol72JYTWVid0fR8TDcp06mGb1eJhWYzoU
	=
X-Gm-Gg: ASbGncut0BcumVTNKGs+8yHMA4u/jj21VKJBDetiHBLSZ3XLMB7MQ8F0wjbARunl7pl
	WSvLPxJdQJfEFAp13vcLmZle7DMgruhE/7T+htaIEqvNcDiia5/VYbu5e+KgKitWWHsnkQpggqG
	PwvxXi7g91ghSS469Fn7wj7rMaot3hlIGOJ3VpVHAI7hAdmyJCaGarEJaXkgAaqB0MA5GHbzWSZ
	LwqpLUlssiDtldHHG+NXctCJpiwQaKFN5Br+NX1WkyF8X5iTVV2ArF6aO9vMlPdNeaY/c7hNpYE
	dUsqKb4rguanM4Q+xPf333UlllOxxhWLiMx2DJpWNSMNsyqPvJ/iibcxOD7XNFNrDA==
X-Google-Smtp-Source: AGHT+IFiWoj5IBVRs7fRvTxR/LR90rWWJ4gCrsmQdt0m9/z68enbRYqT61MCj+aAeIOpSjNs2dIuXw==
X-Received: by 2002:a17:906:6a20:b0:aac:23f4:f971 with SMTP id a640c23a62f3a-ab38b1b45e1mr3466907366b.33.1737979608971;
        Mon, 27 Jan 2025 04:06:48 -0800 (PST)
Message-ID: <39a582e7-272e-478f-8613-166e51f90f72@suse.com>
Date: Mon, 27 Jan 2025 13:06:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20] x86/PV: further harden guest memory accesses
 against speculative abuse
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <a615a96e-95d2-442f-b57d-0bb51142c977@suse.com>
 <Z5dupzj0JnC--YQ7@macbook.local>
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
In-Reply-To: <Z5dupzj0JnC--YQ7@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.01.2025 12:31, Roger Pau Monné wrote:
> On Mon, Jan 27, 2025 at 11:15:22AM +0100, Jan Beulich wrote:
>> --- a/xen/arch/x86/include/asm/asm-defns.h
>> +++ b/xen/arch/x86/include/asm/asm-defns.h
>> @@ -1,3 +1,5 @@
>> +#include <asm/page-bits.h>
>> +
>>  #ifndef HAVE_AS_CLAC_STAC
>>  .macro clac
>>      .byte 0x0f, 0x01, 0xca
>> @@ -65,17 +67,36 @@
>>  .macro guest_access_mask_ptr ptr:req, scratch1:req, scratch2:req
>>  #if defined(CONFIG_SPECULATIVE_HARDEN_GUEST_ACCESS)
>>      /*
>> -     * Here we want
>> -     *
>> -     * ptr &= ~0ull >> (ptr < HYPERVISOR_VIRT_END);
>> -     *
>> +     * Here we want to adjust \ptr such that
>> +     * - if it's within Xen range, it becomes non-canonical,
>> +     * - otherwise if it's (non-)canonical on input, it retains that property,
>> +     * - if the result is non-canonical, bit 47 is clear (to avoid
>> +     *   potentially populating the cache with Xen data),
> 
> It's my understanding from the commit message that this toggling of
> bit 47 is only done due to AMD behavior, as speculative execution
> there ignores any higher than 47, and hence non-canonical inputs are
> no detected when speculatively executing?
> 
> It might be worth explicitly mentioning this in the comment.

Hmm, to be honest I'd rather not (and keep mentioning AMD to the
description). First and foremost because if I mention it here, I
strictly also ought to mention Hygon, I think. In the description I
feel a little easier about not specifically saying so. (But yes, if
you strongly think I should mention vendors here, I'd be okay-ish to
add "on AMD-like hardware" before the closing paren on the 2nd
bullet point.)

Further, with such a consideration, would we perhaps also want to
consider simplifying the transformation when AMD=n in .config? (I
could see us doing so, but not as late in a release cycle as we're
now at. Plus I say so without having thought about whether a
simplification is actually possible.)

>>       * but guaranteed without any conditional branches (hence in assembly).
>> +     *
>> +     * To achieve this we determine which bit to forcibly clear: Either bit 47
>> +     * (in case the address is below HYPERVISOR_VIRT_END) or bit 63.  Further
>> +     * we determine whether for forcably set bit 63: In case we first cleared
>> +     * it, we'll merely restore the original address.  In case we ended up
>> +     * clearing bit 47 (i.e. the address was either non-canonical or within Xen
>> +     * range), setting the bit will yield a guaranteed non-canonical address.
>> +     * If we didn't clear a bit, we also won't set one: The address was in the
>> +     * low half of address space in that case with bit 47 already clear.  The
>> +     * address can thus be left unchanged, whether canonical or not.
> 
> Since for AMD we have to do the bit 47 clearing, won't it be enough to
> do something like:
> 
> ptr &= (ptr < HYPERVISOR_VIRT_END) ? ~(1ULL <<  (VADDR_BITS - 1) : ~0ULL;
> 
> So only care to clear bit 47 when ptr is below HYPERVISOR_VIRT_END?
> As that would already diverge accesses into the Xen address space
> without having to toggle bit 63?

No, this may transform a non-canonical input into a canonical address
(accesses through which then won't #GP as expected), just for a different
address range than where we had the same mistake before.

Jan

