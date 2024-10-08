Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A469951CD
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 16:35:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813183.1226010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syBIB-0002Bg-PF; Tue, 08 Oct 2024 14:34:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813183.1226010; Tue, 08 Oct 2024 14:34:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syBIB-00029n-Mb; Tue, 08 Oct 2024 14:34:27 +0000
Received: by outflank-mailman (input) for mailman id 813183;
 Tue, 08 Oct 2024 14:34:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vy9o=RE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syBI9-00029h-SS
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 14:34:25 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a58a073-8582-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 16:34:24 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c91a7141b8so161712a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 07:34:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9950ef9f45sm306240166b.37.2024.10.08.07.34.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2024 07:34:23 -0700 (PDT)
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
X-Inumbo-ID: 6a58a073-8582-11ef-a0bc-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728398064; x=1729002864; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LA4lJFd9gjECCkUvfg3uw4f0Ym7fSn6imjWNBu9BpSw=;
        b=We34xpTGcWVCKVjP4LWvJj03eaJkVbQFRPT74am46a+9IU4Zjlxn2FBCV7JzmHAEoN
         Zuap8qcFWTqStDZIKyZwsoIRVCD9ciC0f002rVb9xbvdmF8qhd0J66BkRskB9Ies1TLl
         MNaQpyTH591EXAko+5NYr7RVBXUk3CIyjOfZXmd8z+PwD5JG5Qj1wPJl6E6T/XePJKAK
         34wh6j+AHbezuaPKiSi7a1PLdcFj+qUfy2R5vSKf4bf3+WyoHPHj8PdXYRbcgvIKgfX2
         C815ciVJOB8bciHtkxZ73FbTlHV0lmtNFbi2hvcS8kzP7flj4JoOMwY7yQj7xeYG4sdJ
         DYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728398064; x=1729002864;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LA4lJFd9gjECCkUvfg3uw4f0Ym7fSn6imjWNBu9BpSw=;
        b=tfCGqf/aSdQYc7+WKCqpPxfBTnwA5whBzXzlci8bEBSqbZkGLNUXV7fDhWYElGarP9
         semXbLZfM5xJCf22s6E9eQgoLF7d6Rz6SOVi4WsGEChS5F6EJjQArVu8Ct/RP+vzPWHx
         EHnTTvr+/CreEnB39aeOnLy+P5gkoXgdsGGc4EI4innn+BRHenWerp6hnhcfG2lSC7aH
         Flik+OmOVitgfcUA7qv9bgaRFQoo8GU8gJIjtq4+OLjaxEGtrbtMA4adq56Sz5Jzp1x1
         Lyjz6YPS//Q5q5dVzQoAZ5ULEN3UYhmvOfjmih3muBzRiVyEijOMYRQQ3dZlTyTZ/BCf
         A7GQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZ8sHxO1bfCEF7aASAouqlqWtOfFIaOIdw20VWUxcZgubZ9TASNqodvX6AfHSGJCUBEL/mX0C8FPA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyqBg0iTfEBZnNLHL3YMxJ1nVRDrFf6gKsc5lwMAnhFz2Uq4xYu
	6qI8WFgstso6B9kSrBidv90PLwggSsL905Fi7CLKxnvoJ6l7ORHqujOX8T6E2g==
X-Google-Smtp-Source: AGHT+IEu4psKJO5cv7B3wJ5SPMJTjnp2aPK3672HegSm8UjR3Talt+YjxAWRwVZy0LiqOjjekw3REw==
X-Received: by 2002:a17:907:961b:b0:a86:a4b1:d2b8 with SMTP id a640c23a62f3a-a991bcf6f90mr1533956666b.4.1728398064207;
        Tue, 08 Oct 2024 07:34:24 -0700 (PDT)
Message-ID: <3ba27327-a2f1-4544-8437-678ba01f7c4d@suse.com>
Date: Tue, 8 Oct 2024 16:34:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/19] xen: Update header guards - RISC-V
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <20241004081713.749031-1-frediano.ziglio@cloud.com>
 <20241004081713.749031-16-frediano.ziglio@cloud.com>
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
In-Reply-To: <20241004081713.749031-16-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.10.2024 10:17, Frediano Ziglio wrote:
> Updated headers related to RISC-V.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

> ---
>  xen/arch/riscv/include/asm/acpi.h           | 6 +++---
>  xen/arch/riscv/include/asm/asm.h            | 6 +++---
>  xen/arch/riscv/include/asm/atomic.h         | 6 +++---
>  xen/arch/riscv/include/asm/bitops.h         | 6 +++---
>  xen/arch/riscv/include/asm/bug.h            | 6 +++---
>  xen/arch/riscv/include/asm/byteorder.h      | 6 +++---
>  xen/arch/riscv/include/asm/cache.h          | 6 +++---
>  xen/arch/riscv/include/asm/cmpxchg.h        | 6 +++---
>  xen/arch/riscv/include/asm/config.h         | 6 +++---
>  xen/arch/riscv/include/asm/cpufeature.h     | 6 +++---
>  xen/arch/riscv/include/asm/csr.h            | 6 +++---
>  xen/arch/riscv/include/asm/current.h        | 6 +++---
>  xen/arch/riscv/include/asm/domain.h         | 6 +++---
>  xen/arch/riscv/include/asm/early_printk.h   | 6 +++---
>  xen/arch/riscv/include/asm/event.h          | 6 +++---
>  xen/arch/riscv/include/asm/fence.h          | 6 +++---
>  xen/arch/riscv/include/asm/fixmap.h         | 6 +++---
>  xen/arch/riscv/include/asm/flushtlb.h       | 6 +++---
>  xen/arch/riscv/include/asm/guest_access.h   | 6 +++---
>  xen/arch/riscv/include/asm/guest_atomics.h  | 6 +++---
>  xen/arch/riscv/include/asm/io.h             | 6 +++---
>  xen/arch/riscv/include/asm/irq.h            | 6 +++---
>  xen/arch/riscv/include/asm/mm.h             | 6 +++---
>  xen/arch/riscv/include/asm/monitor.h        | 6 +++---
>  xen/arch/riscv/include/asm/nospec.h         | 6 +++---
>  xen/arch/riscv/include/asm/p2m.h            | 6 +++---
>  xen/arch/riscv/include/asm/page-bits.h      | 6 +++---
>  xen/arch/riscv/include/asm/page.h           | 6 +++---
>  xen/arch/riscv/include/asm/pmap.h           | 6 +++---
>  xen/arch/riscv/include/asm/processor.h      | 6 +++---
>  xen/arch/riscv/include/asm/regs.h           | 6 +++---
>  xen/arch/riscv/include/asm/riscv_encoding.h | 4 ++--
>  xen/arch/riscv/include/asm/sbi.h            | 6 +++---
>  xen/arch/riscv/include/asm/setup.h          | 6 +++---
>  xen/arch/riscv/include/asm/smp.h            | 4 ++--
>  xen/arch/riscv/include/asm/spinlock.h       | 6 +++---
>  xen/arch/riscv/include/asm/string.h         | 6 +++---
>  xen/arch/riscv/include/asm/system.h         | 6 +++---
>  xen/arch/riscv/include/asm/time.h           | 6 +++---
>  xen/arch/riscv/include/asm/traps.h          | 6 +++---
>  xen/arch/riscv/include/asm/types.h          | 6 +++---
>  41 files changed, 121 insertions(+), 121 deletions(-)

For the bulk of the changes you didn't Cc anyone who can ack them. Note that
the RISCV section of ./MAINTAINERS presently has only R: entries. You need
to Cc THE REST in such a case.

It is probably also a good idea to Cc the person(s) doing the bulk of the
work in a given area at a given point in time. Then again, Oleksii, maybe
you want to consider adding yourself as R: in that section, too? That way
you will be Cc-ed on patches (as long as people respect ./MAINTAINERS).

Jan

